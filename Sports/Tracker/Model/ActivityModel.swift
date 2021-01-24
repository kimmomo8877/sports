//
//  ActivityModel.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/23.
//

import Foundation

class ActivityModel {
    var activity: Activity
    
    init(activity: Activity) {
        self.activity = activity
    }
    
    var timestamp: Date {
        self.activity.timestamp!
    }
    
    var walk: Int {
        Int(self.activity.walk)
    }
    
    var walkDistance: Int {
        Int(self.activity.walkDistance)
    }
    
    var walkTime: Int {
        Int(self.activity.walkTime)
    }
    
    var walkCalories: Int {
        Int(self.activity.walkCalories)
    }
}
