//
//  TestViewModel.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/21.
//

import SwiftUI

class BandViewModel: NSObject, ObservableObject {
    enum State: Int {
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
        case GET_BCA
        case RUN_HR
        case RUN_InBody
    }
    
    @Published var lastActivity: BandActivityRawModel? = nil
    @Published var lastHR: BandHrRawModel? = nil
    @Published var lastInBody: BandInbodyRawModel? = nil
    @Published var status: String = "None"
    @Published var isLoading = false
    let manager: InBodyBLEManager = InBodyBLEManager.shared()
    var toRunFunc: BandFunction = BandFunction.NOTHING
    var tempActivity: BandActivityRawModel? = nil
    
    override init() {
        super.init()
        manager.initSDK(withCallback: 175, weight: 100, age: 35, gender: "M", deviceName: "InBodyBand2", delegate: self, abnormalDisconnect: #selector(callbackDisconnect(returnValue:)), callback: #selector(callbackConnected(returnValue:)), useHealthKit: false)
        print("initialize complete")
    }
    
    func runHR() {
        print("run HR")
        self.status = "기기 연결중.."
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
                self.status = "측정완료 (심박)"
                self.isLoading = false
                self.lastHR = parsed
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
    
    func getActivity() {
        print("GetActivity")
        self.status = "기기 연결중.. (Activity)"
        self.isLoading = true
        self.tempActivity = nil
        toRunFunc = BandFunction.GET_ACTIVITY
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    @objc func callbackGetActivity(returnValue: NSDictionary) {
        print("callback Activity : \(returnValue)")
        if let retJson: String = returnValue.object(forKey: "JsonData") as? String {
            let jsonData: Data = retJson.data(using: .utf8)!
            print("retJson \(retJson)")
            
            let parsed = try! JSONDecoder().decode(BandActivityRawModel.self, from: jsonData)
//            let walkDate = DateUtils.convertStringToDate(dateString: parsed.Date + " " + parsed.Time)
            
            if tempActivity == nil {
                tempActivity = parsed
            } else {
                tempActivity?.add(act: parsed)
            }
            
            if parsed.IsComplete == 1 {
                BandHttpHandler.sendAct(actData: tempActivity!)
                self.status = "Act 조회 완료"
                self.isLoading = false
                self.lastActivity = self.tempActivity
            }
            
//            ActivityDataManager.shared.saveUser(timestamp: walkDate, walk: parsed.WalkTime, walkTime: parsed.WalkTime,
//                                                walkDistance: parsed.WalkDistance, walkCalories: parsed.WalkCalories) { onSuccess in
//                print("DB saved = \(onSuccess)")
//            }
        }
    }
    
//    func refreshActivity() {
//        DispatchQueue.main.async {
//            self.activities = ActivityDataManager.shared.getActivities().map(ActivityModel.init)
//        }
//    }
        
    @objc func callbackConnected(returnValue:NSDictionary) {
        print("connected : ")
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
            self.isLoading = false
            return
        } else if (errorCode == 6) {
            self.status = "기기접근불가 (Abnormal Disconnected with BLE Errorcode)"
            self.isLoading = false
            return
        } else if (errorCode == 0 && bleState == 0) {
            self.status = "접속종료(정상)"
            self.isLoading = false
            return
        }
        
        switch state {
        case State.IDLE.rawValue:
            print("callback - idle")
        case State.CONNECTED.rawValue:
            print("callback - connected")
            if toRunFunc == BandFunction.GET_HR {
                manager.getHRData(withCallback: #selector(callbackGetHR(returnValue:)), clearData: false)
            } else if toRunFunc == BandFunction.GET_ACTIVITY {
                manager.getActivityData(withCallback: #selector(callbackGetActivity(returnValue:)), clearData: false)
            } else if toRunFunc == BandFunction.GET_BCA {
                manager.getBcaData(withCallback: #selector(callbackGetBCA(returnValue:)), clearData: false)
            } else if toRunFunc == BandFunction.RUN_HR {
                self.status = "심박수 측정중...(기기연결완료)"
                manager.startBandHRTest(withCallback: #selector(callbackRunHR(returnValue:)), isGuestMode: true)
            } else if toRunFunc == BandFunction.RUN_InBody {
                self.status = "인바디 측정중...(기기연결완료)"
                manager.startBandInBodyTest(withCallback: #selector(callbackRunInBody(returnValue:)),
                                            proPBF: 0, proWT: 0, isGuestMode: false, isPBFMode: true)
            }
        case State.CONNECTING.rawValue:
            print("callback - connecting")
        case .none:
            print("callback - none")
        case .some(_):
            print("default")
        }
    }
}
