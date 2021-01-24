//
//  FavoriteModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/16.
//

struct FavoriteModel: Decodable, Hashable, Identifiable {
    let id: Int?
    var searcherNo: String?
    var searchWord: String?
}
