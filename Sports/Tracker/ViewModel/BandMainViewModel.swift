//
//  BandMainViewModel.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/02/02.
//

import Foundation

class BandMainViewModel: NSObject, ObservableObject {
    enum BandState: Int {
        case IDLE = 0
        case SCANNING
        case CONNECTED
        case CONNECTING
        case STOPSCANN
        case UPGRADING
        case UPGRADED
    }
    
    enum BandFunction: Int {
        case NOTHING = 0
        case GET_HR
        case GET_ACTIVITY
        case END_ACTIVITY
        case GET_BCA
        case RUN_HR
        case RUN_InBody
        case RESET
        case SYNC
    }
    
    static let shared: BandMainViewModel = BandMainViewModel()
    
    @Published var isLoading = false
    @Published var isReady: Int? = 0
    
    var exerciseId: Int = -1
    let manager: InBodyBLEManager = InBodyBLEManager.shared()
    var toRunFunc: BandFunction = BandFunction.NOTHING
    
    override init() {
        super.init()
        print("init main view model")
//        manager.initSDK(withCallback: 175, weight: 100, age: 35, gender: "M", deviceName: "InBodyBand2", delegate: self, abnormalDisconnect: #selector(callbackDisconnect(returnValue:)), callback: #selector(callbackConnected(returnValue:)), useHealthKit: false)
    }
    
    func setProfileSync() {
        manager.initSDK(withCallback: 175, weight: 100, age: 35, gender: "M", deviceName: "InBodyBand2", delegate: self, abnormalDisconnect: #selector(callbackDisconnect(returnValue:)), callback: #selector(callbackConnected(returnValue:)), useHealthKit: false)
        self.isLoading = true
        toRunFunc = BandFunction.SYNC
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    @objc func callbackSetProfileSync(returnValue: NSDictionary) {
        print("setProfileSync : \(returnValue)")
        if let retJson: String = returnValue.object(forKey: "JsonData") as? String {
            let jsonData: Data = retJson.data(using: .utf8)!
            let parsed = try! JSONDecoder().decode(BandSyncRawModel.self, from: jsonData)
            
            if parsed.IsComplete == 1 {
                sendBeginRequest()
            } else {
                self.isReady = 0
                self.isLoading = false
            }
        }
    }
    
    @objc func callbackConnected(returnValue:NSDictionary) {
        print("connected : \(returnValue)")
        print(returnValue)
    }
    
    @objc func callbackDisconnect(returnValue:NSDictionary) {
        print("disconnected : \(returnValue)")
        
        let state: Int? = returnValue.object(forKey: "BleState") as? Int
        let errorCode: Int? = returnValue.object(forKey: "ErrorCode") as? Int
        let bleState: Int? = returnValue.object(forKey: "BleState") as? Int
        print("State : \(state ?? -9999), ErrorCode: \(errorCode ?? -9999)")
        
        if (errorCode == -3 || errorCode == -1) {
//            self.status = "기기접근불가 (Timeout)"
            self.isLoading = false
            return
        } else if (errorCode == 6) {
//            self.status = "기기접근불가 (Abnormal Disconnected with BLE Errorcode)"
            self.isLoading = false
            return
        } else if (errorCode == 0 && bleState == 0) {
//            self.status = "접속종료(정상)"
            self.isLoading = false
            return
        }
        
        switch state {
        case BandState.IDLE.rawValue:
            print("callback - idle")
        case BandState.CONNECTED.rawValue:
            print("callback - connected")
            if toRunFunc == BandFunction.SYNC {
                manager.setProfileSync(withCallback: #selector(callbackSetProfileSync(returnValue:)))
            }
        case BandState.CONNECTING.rawValue:
            print("callback - connecting")
        case .none:
            print("callback - none")
        case .some(_):
            print("default")
        }
    }
    
    func sendBeginRequest() {
        self.isLoading = true
        self.isReady = 0
        
        let jsonDict:[String: Any] = ["exerType": "Tracking", "bodyComposition": ["timestamp": DateUtils.currentDateString()]]
        
        let url = URL(string: "http://www.kbostat.co.kr/resource/tracking/begin")!
        let serializedData = try! JSONSerialization.data(withJSONObject: jsonDict, options: [])
        let toRequestjsonText = String(decoding: serializedData, as: UTF8.self)
        print("requestBody : \(toRequestjsonText)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = serializedData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("requestError :", error)
                self.isLoading = false
                self.isReady = 0
                return
            }
            
            do {
                guard let data = data else { return }
                guard let resultData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return }
                
                self.exerciseId = resultData["targetExercises"]!["targetExerNo"] as! Int
                print("exerciseNumber = \(self.exerciseId)")
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.isReady = 1
                }
            } catch {
                print("responseJsonParsingError :", error)
            }
        }
        
        task.resume()
    }
}
