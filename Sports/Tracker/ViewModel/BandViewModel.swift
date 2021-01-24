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
    }
    
    @Published var activities = [ActivityModel]()
    let manager: InBodyBLEManager = InBodyBLEManager.shared()
    var toRunFunc: BandFunction = BandFunction.NOTHING
    
    override init() {
        super.init()
        manager.initSDK(withCallback: 175, weight: 100, age: 35, gender: "M", deviceName: "InBodyBand2", delegate: self, abnormalDisconnect: #selector(callbackDisconnect(returnValue:)), callback: #selector(callbackConnected(returnValue:)), useHealthKit: false)
        print("initialize complete")
    }
    
    func getHR() {
        print("GetHR")
        toRunFunc = BandFunction.GET_HR
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    @objc func callbackGetHR(returnValue: NSDictionary) {
        print("callback HR : \(returnValue)")
    }
    
    func getActivity() {
        print("GetActivity")
        toRunFunc = BandFunction.GET_ACTIVITY
        manager.connectDisconnect(withCallback: #selector(callbackDisconnect(returnValue:)), isNeedScanList: true)
    }
    
    @objc func callbackGetActivity(returnValue: NSDictionary) {
        print("callback Activity : \(returnValue)")
        if let retJson: String = returnValue.object(forKey: "JsonData") as? String {
            let jsonData: Data = retJson.data(using: .utf8)!
            print("retJson \(retJson)")
            
            let parsed = try! JSONDecoder().decode(BandActivityRaw.self, from: jsonData)
            let walkDate = DateUtils.convertStringToDate(dateString: parsed.Date + " " + parsed.Time)
            
            if parsed.IsComplete == 1 {
                
            }
            
            ActivityDataManager.shared.saveUser(timestamp: walkDate, walk: parsed.WalkTime, walkTime: parsed.WalkTime,
                                                walkDistance: parsed.WalkDistance, walkCalories: parsed.WalkCalories) { onSuccess in
                print("DB saved = \(onSuccess)")
            }
            
            if parsed.IsComplete == 1 {
                refreshActivity()
            }
        }
    }
    
    func refreshActivity() {
        DispatchQueue.main.async {
            self.activities = ActivityDataManager.shared.getActivities().map(ActivityModel.init)
        }
    }
        
    @objc func callbackConnected(returnValue:NSDictionary) {
        print("connected : ")
        print(returnValue)
    }
    
    @objc func callbackDisconnect(returnValue:NSDictionary) {
        print("disconnected : \(returnValue)")
        
        let state: Int? = returnValue.object(forKey: "BleState") as? Int
        print("State : \(state ?? -1)")
        
        switch state {
        case State.IDLE.rawValue:
            print("callback - idle")
        case State.CONNECTED.rawValue:
            print("callback - connected")
            if toRunFunc == BandFunction.GET_HR {
                manager.getHRData(withCallback: #selector(callbackGetHR(returnValue:)), clearData: false)
            } else if toRunFunc == BandFunction.GET_ACTIVITY {
                manager.getActivityData(withCallback: #selector(callbackGetActivity(returnValue:)), clearData: false)
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
