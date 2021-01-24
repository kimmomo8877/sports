//
//  HomeIntro.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/13.
//

import SwiftUI

struct HomeIntro: View {
    
    var title: String
    var subTitle: String
    
    var body: some View{
        //        GeometryReader{ geometry in
        VStack(alignment: .leading){
            Text(title)
                .font(.system(size:20))
                .fontWeight(.black)
                .padding(.bottom,5)
            Button(action:{
                
            }){
                Text(subTitle)
                    .foregroundColor(.secondary)
            }
            
        }
//        .frame(weight: 200)
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(Rectangle()
                    .stroke(lineWidth: 0.5)
                    
        )
    }
    
}

struct MainIntroView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeIntro(title: "2222전지훈련팀 스포츠 투어링이 처음이신가요?", subTitle: "서비스소개adafds12 ")
        }
    }
}
