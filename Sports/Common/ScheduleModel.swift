//
//  ScheduleModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/04/17.
//

struct ScheduleModel: Decodable, Hashable {
    var endDate: String?
    var modifyDate: String?
    var registeDate: String?
    var reservation: String?
    var reservationNo: String?
    var scheduleNo: String?
    var scheduleTargetNo: String?
    var scheduleType: String?
    var startDate: String?
    var title: String?
}
