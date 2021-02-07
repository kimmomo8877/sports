//
//  BandActivity.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/22.
//

import Foundation

struct BandActivityRawModel: Decodable, Hashable {
    mutating func add(act: BandActivityRawModel) {
        self.Walk += act.Walk
        self.WalkTime += act.WalkTime
        self.WalkCalories += act.WalkCalories
        self.WalkDistance += act.WalkDistance
        self.RunCalories += act.RunCalories
        self.RunDistance += act.RunDistance
    }
    
    mutating func minus(act: BandActivityRawModel) {
        self.Walk -= act.Walk
        self.WalkTime -= act.WalkTime
        self.WalkCalories -= act.WalkCalories
        self.WalkDistance -= act.WalkDistance
        self.RunCalories -= act.RunCalories
        self.RunDistance -= act.RunDistance
    }
    
    var Date: String
    var Time: String
    var Walk: Int
    var WalkTime: Int
    var WalkCalories: Int
    var WalkDistance: Int
    var Run: Int
    var RunTime: Int
    var RunCalories: Int
    var RunDistance: Int
    var RemainData: Int?
    var IsComplete: Int
}
