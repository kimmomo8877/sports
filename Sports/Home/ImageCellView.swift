//
//  ImageCell.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI
import Kingfisher

struct ImageCell: View {
    var imageUrl: String
    var title: String

    init(imageUrl: String!, title: String!) {
        self.title = title
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        KFImage(URL(string: self.imageUrl))
            .resizable()
            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .overlay(OverlayText(overlayText: self.title), alignment: .bottom)
    }
    
    static let defaultImage = UIImage(named: "TestSports")
}

struct OverlayText: View {
    let overlayText: String
    
    var body: some View {
        ZStack {
            Text(overlayText)
                .font(.caption)
                .foregroundColor(.white)
        }
//        .background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}

struct ImageCell_Previews: PreviewProvider {
    static var previews: some View {
        ImageCell(imageUrl: "https://via.placeholder.com/150/771796", title: "Title")
    }
}
