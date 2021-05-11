//
//  HomeIntro.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/13.
//

import SwiftUI

struct TeamNoticeBoardView: View {
    
    var title: String
    var content: String
    var registerDate: String
    var geo: GeometryProxy
    
    var body: some View{
        //        GeometryReader{ geometry in
        VStack(alignment: .leading){
            HStack() {
            Text(title)
                .font(.system(size:20))
                .fontWeight(.black)
                .padding(.bottom,3)
                Spacer()
            }
            HStack() {
            Text(content)
                .font(.system(size:15))
                .fontWeight(.black)
                .padding(.bottom,3)
                Spacer()
            }
            HStack() {
            Text(registerDate)
                .font(.system(size:13))
                .fontWeight(.black)
                .foregroundColor(.secondary)
                .padding(.bottom,3)
                Spacer()
            }
            
//                .fixedSize(horizontal: false, vertical: true)
//            Button(action:{
//
//                if let url = URL(string: "http://www.kbostat.co.kr/pr/system") {
//                    UIApplication.shared.open(url)
//                }
//
//            }){
//                Text(subTitle)
//                    .foregroundColor(.secondary)
//            }
            
        }
        .frame(width: geo.size.width * 0.84, height: 80)
        .padding(20)
//        .padding(.trailing, -10)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(Rectangle()
                    .stroke(lineWidth: 0.5).cornerRadius(1)
                    
        )
    }
    
}

