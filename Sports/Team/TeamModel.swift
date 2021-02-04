//
//  TeamModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/04.
//

struct TeamModel: Decodable, Hashable {
    var register: UserModel?
    var teamNo: String?
    var name: String?
    var phoneNumber: String?
    var homepageUrl: String?
    var registeApprove: Bool?
    var classificationCodeId: Int?
    var belongedCodeId: Int?
    var genderCodeId: Int?
    var regionCodeId: Int?
    var sportCodeId: Int?
    var classificationCode: CodeModel?
    var belongCode: CodeModel?
    var genderCode: CodeModel?
    var regionCode: CodeModel?
    var psortCode: CodeModel?
    var deleteYn: Bool?
}
