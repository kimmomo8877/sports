//
//  Code.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/14.
//

struct Code: Decodable, Hashable {
    var codeId: Int?
    var indexCodeId: Int?
    var parentCodeId: Int?
    var name: String?
}
