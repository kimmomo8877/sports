//
//  Charge.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/14.
//

struct ChargeModel: Decodable, Hashable {
//    let id: Int
    var chargeNo: String?
    var chargeTypeNo: Int?
    var infraNo: String?
    var timeUnit: Int?
    var cost: Int?
}
