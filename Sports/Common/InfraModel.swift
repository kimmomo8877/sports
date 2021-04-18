//
//  Infra.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/13.
//

import SwiftUI

struct InfraModel: Decodable, Hashable {
//    let id: Int?
    var infraNo: String?
    var infraCategoryNo: Int?
    var parentInfraNo: String?
    var sportCodeId: Int?
    let infraCategory: InfraCategoryModel?
    let sportCode: SportCodeModel?
    var childInfras: Array<InfraModel>?
    var attachFiles: Array<AttachFileModel>?
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
    var longitude: Double?
    var charges: Array<ChargeModel>?
    var reservationCnt: Int?
    var regionCode: CodeModel?
//    var registeDate: Date?
//    var modifyDate: Date?
//    var deleteDate: Date?
    var deleteYn: Bool?
    var checkVisiable: Int?
    var firstPrVideoUrl: String?
    var secondPrVideoUrl: String?
    var thirdPrVideoUrl: String?
    
}

