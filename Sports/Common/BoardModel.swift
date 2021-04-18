//
//  BoardModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/04/17.
//

struct BoardModel: Decodable, Hashable {
    var boardNo: Int?
    var writerNo: String?
    var writer: BoardWriterModel?
    var contentNo: String?
    var title: String?
    var content: String?
    var replyWritable: Bool?
    var likeCnt: Int?
    var viewCnt: Int?
    var registeDate: String?
    var modifyDate: String?
    var deleteDate: String?
    var deleteYn: Bool?
    var attachFiles: Array<AttachFileModel>?
    
}
