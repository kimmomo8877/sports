//
//  VirtualModel.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI
import Kingfisher

struct VirtualModel: Decodable, Hashable, Identifiable {
    let id: Int
    var albumId: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
