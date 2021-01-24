//
//  Infra.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/13.
//

import SwiftUI

struct Infra: Decodable, Hashable {
//    let id: Int?
    var infraNo: String?
    var infraCategoryNo: Int?
    var parentInfraNo: String?
    var sportCodeId: Int?
    let sportCode: SportCode?
    var childInfras: Array<Infra>?
    var attachFiles: Array<AttachFile>?
    var name: String?
    var phoneNumber: String?
    var address: String?
    var homepageUrl: String?
    var facilityDescription: String?
    var equipmentDescription: String?
    var etcDescription: String?
    var useRuleDescription: String?
    var refundPolicyDescription: String?
    var latitude: Double?
    var longtitude: Double?
    var charges: Array<Charge>?
    var reservationCnt: Int?
//    var registeDate: Date?
//    var modifyDate: Date?
//    var deleteDate: Date?
    var deleteYn: Bool?
    
}

