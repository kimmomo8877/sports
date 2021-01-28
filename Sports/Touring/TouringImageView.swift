//
//  TouringImageView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/27.
//
import SwiftUI

struct TouringImageView: View {
    
    var image: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View{
        Image(image)
            .resizable()
            .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct TouringImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TouringImageView(image: "image", width: 100, height: 100)
        }
    }
}
