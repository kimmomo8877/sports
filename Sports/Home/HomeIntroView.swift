//
//  HomeIntro.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/13.
//

import SwiftUI

struct HomeIntroView: View {
    
    var title: String
    var subTitle: String
    var geo: GeometryProxy
    
    var body: some View{
        //        GeometryReader{ geometry in
        VStack(alignment: .leading){
            Text(title)
                .font(.system(size:20))
                .fontWeight(.black)
                .padding(.bottom,5)
//                .fixedSize(horizontal: false, vertical: true)
            Button(action:{
                
            }){
                Text(subTitle)
                    .foregroundColor(.secondary)
            }
            
        }
        .frame(width: geo.size.width * 0.84)
        .padding(20)
//        .padding(.trailing, -10)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(Rectangle()
                    .stroke(lineWidth: 0.5)
                    
        )
    }
    
}

