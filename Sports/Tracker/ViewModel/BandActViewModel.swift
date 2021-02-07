//
//  TestViewModel.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/21.
//

import SwiftUI

class BandActViewModel: NSObject, ObservableObject {
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
        case INIT_ACTIVITY
        case GET_ACTIVITY
        case END_ACTIVITY
        case GET_BCA
        case RUN_HR
        case RUN_InBody
        case RESET
        case SYNC
    }
    
    static let shared: BandActViewModel = BandActViewModel()
    
    @Published var firstActivity: BandActivityRawModel? = nil
    @Published var completeActivity: BandActivityRawModel? = nil
    @Published var tempActivity: BandActivityRawModel? = nil
    @Published var lastHR: BandHrRawModel? = nil
    @Published var lastInBody: BandInbodyRawModel? = nil
    @Published var status: String = "None"
    @Published var showingPopup = false
    @Published var isLoading: Bool = false
    @Published var isRunning: Bool = false
    @Published var isFinished: Bool = false
    
//    트래커 메인페이지
    @Published var trackingCount = 0
    @Published var trackingDistance = 0
    @Published var trackingCalories = 0
    @Published var trackingTime = 0
    
    var exerciseId: Int = -1
    let manager: InBodyBLEManager = InBodyBLEManager.shared()
    var toRunFunc: BandFunction = BandFunction.NOTHING
    
    override init() {
        super.init()
        print("init band act model")
        manager.initSDK(withCallback: 175, weight: 100, age: 35, gender: "M", deviceName: "InBodyBand2", delegate: self, abnormalDisconnect: #selector(callbackDisconnect(returnValue:)), callback: #selector(callbackConnected(returnValue:)), useHealthKit: false)
    }
    
    func initTrackingData() {
        self.trackingCount = 0
        self.trackingDistance = 0
        self.trackingCalories = 0
        self.trackingTime = 0
    }
    
    func toggleIsRunning() {
        self.isRunning.toggle()
    }
    
    func setProfileSync() {
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
                DispatchQueue.main.async {
                    self.isRunning = false
                    self.isLoading = false
                }
            }
        }
    }
    
    func setFactoryReset() {
        toRunFunc = BandFunction.RESET
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    @objc func callbackFactoryReset(returnValue: NSDictionary) {
        print("returnValue")
    }
    
    func runHR() {
        print("run HR")
        self.status = "기기 연결중.."
        self.showingPopup = true
        self.isLoading = true
        toRunFunc = BandFunction.RUN_HR
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    @objc func callbackRunHR(returnValue: NSDictionary) {
        print("callback RunHR : \(returnValue)")
        if let retJson: String = returnValue.object(forKey: "JsonData") as? String {
            let jsonData: Data = retJson.data(using: .utf8)!
            print("retJson \(retJson)")
            
            let parsed = try! JSONDecoder().decode(BandHrRawModel.self, from: jsonData)
            if parsed.IsComplete == 1 {
                self.lastHR = parsed
                sendHeartBeatRequest(heartRateData: parsed)
            } else {
                self.status = "심박 측정중...(손가락 올려)"
            }
        }
    }
    
    func removeDevice() {
        print("Disconnect")
        manager.removeDevice(withCallback: #selector(callbackRemoveDevice(returnValue:)))
    }
    
    @objc func callbackRemoveDevice(returnValue: NSDictionary) {
        print("callback RemoveDevice : \(returnValue)")
    }
    
    func runInBody() {
        print("RunInBody")
        self.status = "기기 연결중.. (InBody)"
        self.isLoading = true
        toRunFunc = BandFunction.RUN_InBody
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    @objc func callbackRunInBody(returnValue: NSDictionary) {
        print("callbackRunInbody : \(returnValue)")
        if let retJson: String = returnValue.object(forKey: "JsonData") as? String {
            let jsonData: Data = retJson.data(using: .utf8)!
            print("retJson \(retJson)")
            
            let parsed = try! JSONDecoder().decode(BandInbodyRawModel.self, from: jsonData)
            if parsed.IsComplete == 1 {
                self.status = "측정완료 (InBody)"
                self.isLoading = false
                self.lastInBody = parsed
            } else {
                self.status = "인바디 측정중...(손가락 올려)"
            }
        }
    }
    
    func getBCA() {
        print("GetBCA")
        self.status = "기기 연결중.."
        toRunFunc = BandFunction.GET_BCA
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    @objc func callbackGetBCA(returnValue: NSDictionary) {
        print("callback BCA : \(returnValue)")
    }
    
    func getHR() {
        print("GetHR")
        self.status = "기기 연결중.. (심박측정)"
        toRunFunc = BandFunction.GET_HR
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    @objc func callbackGetHR(returnValue: NSDictionary) {
        print("callback HR : \(returnValue)")
    }
    
    func getActivity(isEnd: Bool) {
        print("GetActivity")
        DispatchQueue.main.async {
            self.status = "기기 연결중.. (Activity)"
            self.isLoading = true
        }
        
        if isEnd {
            self.toRunFunc = BandFunction.END_ACTIVITY
        } else {
            self.toRunFunc = BandFunction.GET_ACTIVITY
        }
        
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    func initActivity() {
        print("InitActivity")
        DispatchQueue.main.async {
            self.status = "기기 연결중.. (Activity)"
            self.isLoading = true
        }
        
        self.toRunFunc = BandFunction.INIT_ACTIVITY
        
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    @objc func callbackInitTracking(returnValue: NSDictionary) {
        print("callback initTracking : \(returnValue)")
        if let retJson: String = returnValue.object(forKey: "JsonData") as? String {
            let jsonData: Data = retJson.data(using: .utf8)!
            print("init activity callback json \(retJson)")
            
            let parsedActivityData = try! JSONDecoder().decode(BandActivityRawModel.self, from: jsonData)
            self.firstActivity = parsedActivityData
            if parsedActivityData.IsComplete == 1 {
                sendBeginRequest()
            }
        }
        
        
    }
    
    @objc func callbackGetTracking(returnValue: NSDictionary) {
        print("callback getTracking : \(returnValue)")
        handleActivityData(returnValue: returnValue, isEnd: false)
    }
    
    @objc func callbackEndTracking(returnValue: NSDictionary) {
        print("callback endTracking : \(returnValue)")
        handleActivityData(returnValue: returnValue, isEnd: true)
        
    }
    
    func handleActivityData(returnValue: NSDictionary, isEnd: Bool) {
        if let retJson: String = returnValue.object(forKey: "JsonData") as? String {
            let jsonData: Data = retJson.data(using: .utf8)!
            print("activity callback json \(retJson)")
            
            var parsedActivityData = try! JSONDecoder().decode(BandActivityRawModel.self, from: jsonData)
            if parsedActivityData.IsComplete == 1 {
                // 현재
                if completeActivity == nil {
                    // minus first
                    parsedActivityData.minus(act: firstActivity!)
                }
                
                tempActivity = parsedActivityData
                calculateAllActivity()
            } else {
                // 과거
                if completeActivity == nil {
                    // minus first
                    parsedActivityData.minus(act: firstActivity!)
                    completeActivity = parsedActivityData
                }
                
                completeActivity!.add(act: parsedActivityData)
            }
            
            sendTrackingRequest(trackingData: parsedActivityData, isEnd: isEnd)
        }
    }
    
    func calculateAllActivity() {
        var trackingTime = tempActivity!.WalkTime + tempActivity!.RunTime
        var trackingCount = tempActivity!.Walk + tempActivity!.Run
        var trackingDistance = tempActivity!.WalkDistance + tempActivity!.RunDistance
        var trackingCalories = tempActivity!.WalkCalories + tempActivity!.RunCalories
        
        if completeActivity != nil {
            trackingTime += (completeActivity!.WalkTime + completeActivity!.RunTime)
            trackingCount += (completeActivity!.Walk + completeActivity!.Run)
            trackingDistance += (completeActivity!.WalkDistance + completeActivity!.RunDistance)
            trackingCalories += (completeActivity!.WalkCalories + completeActivity!.RunCalories)
        }
        
        self.trackingTime = trackingTime
        self.trackingCount = trackingCount
        self.trackingDistance = trackingDistance
        self.trackingCalories = trackingCalories
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
            self.status = "기기접근불가 (Timeout)"
            self.showingPopup = true
            self.isLoading = false
            return
        } else if (errorCode == 6) {
            self.status = "기기접근불가 (Abnormal Disconnected with BLE Errorcode)"
            self.showingPopup = true
            self.isLoading = false
            return
        } else if (errorCode == 0 && bleState == 0) {
            self.status = "기기접근불가 (Busy)"
            self.showingPopup = true
            self.isLoading = false
            return
        }
        
        switch state {
        case BandState.IDLE.rawValue:
            print("callback - idle")
        case BandState.CONNECTED.rawValue:
            print("callback - connected")
            if toRunFunc == BandFunction.GET_HR {
                manager.getHRData(withCallback: #selector(callbackGetHR(returnValue:)), clearData: false)
            } else if toRunFunc == BandFunction.INIT_ACTIVITY {
                manager.getActivityData(withCallback: #selector(callbackInitTracking(returnValue:)), clearData: true)
            } else if toRunFunc == BandFunction.GET_ACTIVITY {
                manager.getActivityData(withCallback: #selector(callbackGetTracking(returnValue:)), clearData: true)
            } else if toRunFunc == BandFunction.END_ACTIVITY {
                manager.getActivityData(withCallback: #selector(callbackEndTracking(returnValue:)), clearData: true)
            } else if toRunFunc == BandFunction.GET_BCA {
                manager.getBcaData(withCallback: #selector(callbackGetBCA(returnValue:)), clearData: false)
            } else if toRunFunc == BandFunction.RUN_HR {
                self.status = "심박수 측정중...(기기연결완료)"
                manager.startBandHRTest(withCallback: #selector(callbackRunHR(returnValue:)), isGuestMode: true)
            } else if toRunFunc == BandFunction.RUN_InBody {
                self.status = "인바디 측정중...(기기연결완료)"
                manager.startBandInBodyTest(withCallback: #selector(callbackRunInBody(returnValue:)), proPBF: 0, proWT: 0, isGuestMode: false, isPBFMode: true)
            } else if toRunFunc == BandFunction.RESET {
                manager.setBandFactoryReset(#selector(callbackFactoryReset(returnValue:)))
            } else if toRunFunc == BandFunction.SYNC {
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
    
    
}

extension BandActViewModel {
    func sendBeginRequest() {
        let userNo = UserDefaults.standard.string(forKey: "userNo")
        let targetNo = UserDefaults.standard.integer(forKey: "targetNo")
        
        let jsonDict:[String: Any] = ["exerType": "Tracking", "userNo": userNo!, "targetNo": targetNo, "bodyComposition": ["timestamp": DateUtils.currentDateString()]]

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
                self.isRunning = false
                self.status = "운동시작실패"
                return
            }

            do {
                guard let data = data else { return }
                guard let resultData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return }
                
                self.exerciseId = resultData["targetExercises"]!["targetExerNo"] as! Int
                print("exerciseNumber = \(self.exerciseId)")
                DispatchQueue.main.async {
                    self.status = "운동시작"
                    self.isLoading = false
                    self.showingPopup = true
                    self.isRunning = true
                }
            } catch {
                print("responseJsonParsingError :", error)
            }
        }

        task.resume()
    }
    
    func sendTrackingRequest(trackingData: BandActivityRawModel, isEnd:Bool) {
        let userNo = UserDefaults.standard.string(forKey: "userNo")
        let targetNo = UserDefaults.standard.integer(forKey: "targetNo")
        
        let jsonDict:[String: Any] = ["exerType": "Tracking", "userNo": userNo!, "targetNo": targetNo, "targetExerNo": self.exerciseId, "tracking": ["timestamp": trackingData.Date + " " + trackingData.Time,
                                                                           "walk": trackingData.Walk, "walkTime": trackingData.WalkTime, "walkCalories": trackingData.WalkCalories,
                                                                           "walkDistance": trackingData.WalkDistance, "run": trackingData.Run, "runTime": trackingData.RunTime,
                                                                           "runCalories": trackingData.RunCalories, "runDistance": trackingData.RunDistance, "isComplete": trackingData.IsComplete]]
        
        
        let url = URL(string: "http://www.kbostat.co.kr/resource/tracking/" + (isEnd ? "end" : "exercise"))!
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
                return
            }
            
            if isEnd {
                DispatchQueue.main.async {
                    self.isFinished = true
                    self.isRunning = false
                    self.status = "운동 종료"
                    self.isLoading = false
                }
            } else {
                DispatchQueue.main.async {
                    self.isFinished = false
                    self.isRunning = true
                    self.status = "트래킹 데이터 조회성공"
                    self.isLoading = false
                }
            }
            
        }
        
        task.resume()
    }
    
    func sendHeartBeatRequest(heartRateData: BandHrRawModel) {
        let userNo = UserDefaults.standard.string(forKey: "userNo")
        let targetNo = UserDefaults.standard.integer(forKey: "targetNo")
        
        let jsonDict:[String: Any] = ["exerType": "Tracking", "userNo": userNo!, "targetNo": targetNo, "targetExerNo": self.exerciseId, "heartRate": ["timestamp": heartRateData.Date! + " " + heartRateData.Time!,
                                                                                                                     "hr": heartRateData.HR!]]
        
        
        let url = URL(string: "http://www.kbostat.co.kr/resource/tracking/exercise")!
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
                return
            }
            
            DispatchQueue.main.async {
                self.status = "측정완료 (심박)"
                self.showingPopup = true
                self.isLoading = false
            }
        }
        
        task.resume()
    }
}
