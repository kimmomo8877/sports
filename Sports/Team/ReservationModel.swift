//
//  ReservationModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/13.
//

struct ReservationModel: Decodable, Hashable {
    var reservaterNo: String?
    var registerNo: String?
    var teamNo: String?
    var infraNo: String?
    var parentInfraNo: String?
    var reservationStateCodeId: Int?
    var reservater: UserModel?
    var register: UserModel?
    var team: TeamModel?
    var infra: InfraModel?
    var reservationStateCode: CodeModel?
    var reservationNo: String?
    var startDate: String?
    var endDate: String?
    var approve: Bool?
    var errMsg: String?
    var registeDate: String?
    var attachFiles: Array<AttachFileModel>?
}
