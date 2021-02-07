//
//  TargetInfoModel.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/02/04.
//

import Foundation

struct TargetInfoModel: Decodable, Hashable {
    var targetNo: Int
    var infra: TargetInfraModel
}

