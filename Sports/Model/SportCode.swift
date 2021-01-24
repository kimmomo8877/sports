//
//  SportCode.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/14.
//
import SwiftUI
struct SportCode: Decodable, Hashable{

    var codeTypeName: String?
    var codeId: Int?
    var name: String?
    let isDisplay: Bool?
}
