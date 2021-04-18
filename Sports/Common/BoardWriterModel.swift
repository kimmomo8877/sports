//
//  BoardWriterModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/04/17.
//

struct BoardWriterModel: Decodable, Hashable {
    var userNo: String?
    var name: String?
    var birthdate: String?
    var email: String?
    var signupApprove: Bool?
    var registeDate: String?
    var modifyDate: String?
    var deleteDate: String?
    var deleteYn: Bool?
    var userTypeCodeId: Int?
    var userTypeCode: CodeModel?
    var classificationCodeId: Int?
    var classificationCode: CodeModel?
    var genderCodeId: Int?
    var genderCode: CodeModel?
    var regionCodeId: Int?
    var regionCode: CodeModel?
    var sportCodeId: Int?
    var sportCode: CodeModel?
    var belongedCodeId: Int?
    var belongCode: CodeModel?
    var imageUrl: String?
    var teamName: String?
}
