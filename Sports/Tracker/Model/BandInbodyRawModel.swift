//
//  BandInbodyRawModel.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/31.
//

import Foundation

struct BandInbodyRawModel: Decodable, Hashable {
    var Date: String?
    var Time: String?
    var PBF: Float?
    var FFM: Float?
    var TBW: Float?
    var IMP: Float?
    var SMM: Float?
    var BFM: Float?
    var IsComplete: Int
}
