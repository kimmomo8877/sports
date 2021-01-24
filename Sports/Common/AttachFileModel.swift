//
//  AttachFile.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/14.
//

import SwiftUI

struct AttachFileModel: Decodable, Hashable {

    var saveFilePath: String?
    var savePath: String?
    var originalName: String?
    var saveName: String?
    var size: Double?
//    var `extension`: String?
//    var registeDate: Date?
//    var modifyDate: Date?
//    var deleteDate: Date?
    var deleteYn: Bool?
    var attachType: String?
}
