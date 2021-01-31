//
//  BandHrRawModel.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/30.
//

import Foundation

struct BandHrRawModel: Decodable, Hashable {
    var Date: String?
    var Time: String?
    var HR: Int?
    var IsComplete: Int
}
