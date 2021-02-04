//
//  BandManager.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/02/02.
//

import Foundation

class BandManager: NSObject, ObservableObject {
    static let shared: BandManager = BandManager()
    
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
}
