//
//  InfraCategory.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/13.
//

import SwiftUI
import Kingfisher

struct InfraCategoryModel: Decodable, Hashable{

    var infraCategoryNo: Int?
    var parentInfraCategoryNo: Int?
//    var parentInfraCategory: Array<InfraCategoryModel>?
//    var parentInfraCategory: String?
    var name: String?
//    var infras: Set<InfraCategory>
    var iconClassName: String?
}

//[{"infraCategoryNo":1,"parentInfraCategoryNo":null,"parentInfraCategory":null,"name":"스포츠 시설","iconClassName":null},
