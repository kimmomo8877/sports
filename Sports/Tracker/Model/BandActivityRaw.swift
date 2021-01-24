//
//  BandActivity.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/22.
//

import Foundation

struct BandActivityRaw: Decodable, Hashable {
    var Date: String
    var Time: String
    var Walk: Int
    var WalkTime: Int
    var WalkCalories: Int
    var WalkDistance: Int
    var Run: Int
    var RunCalories: Int
    var RunDistance: Int
    var RemainData: Int?
    var IsComplete: Int
}
