//
//  SportView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/25.
//

import SwiftUI

struct SportView: View {
    
    @State private var isTrackerShowing = false
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack(alignment: .top) {
                    NavigationLink(destination: TrackingConfigView(), isActive: $isTrackerShowing) {
                        
                    }.navigationBarTitle("스포츠재활", displayMode: .inline)
                    .navigationBarItems(trailing:
                                            Button(action: {
                                                self.isTrackerShowing = true
                                            }) {
                                                Spacer()
                                                Text("트래커")
                                                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .padding(5)
                                                    .foregroundColor(Color.white)
                                                    .background(Color.black)
                                                    .cornerRadius(15)
                                            }
                        .transition(.move(edge: .trailing))
                                            .animation(.default)
                    )
                    
                    Text("간편히 온라인으로 예약하고 \n            내 몸 측정하기!").font(.system(size:25))
                        .frame(width: geo.size.width, height: 180 )
//                        .padding(.top,15).padding(.bottom,200)
//                        .overlay(Rectangle()
//                                    .stroke(lineWidth: 0.5))
//                        .background(Color.yellow).brightness(0.6)
                        .foregroundColor(Color.white)
                        .background(Image("sport_main").resizable())
                    
                    
                    
                    VStack(alignment: .center) {
                        
                        Spacer().frame(height: 130)
                        
                        Button(action:{
                            
                        }){
                            VStack(alignment: .center) {
                                Text("국민체력 100").font(.system(size:25))
                                Text("국민체력 100으로\n100세까지 건강하게")
//                                    .foregroundColor(.secondary)
                                    .font(.system(size:15)).padding(.top,3)
                            }
                        }.frame(width: geo.size.width * 0.9, height: 100)
                        .padding(.top,15).padding(.bottom,15)
                        .overlay(Rectangle()
                                    .stroke(lineWidth: 0.5))
                        .foregroundColor(Color.white)
                        .background(Image("sport_sub1").resizable())
//                        .background(Color.gray).brightness(0.3)
                        
                        Button(action:{
                            
                        }){
                            VStack(alignment: .center) {
                                Text("스포츠과학센터").font(.system(size:25))
                                Text("선수들의 경기력을 향상하고 \n 스포츠 과학을 지원합니다")
//                                    .foregroundColor(.secondary)
                                    .font(.system(size:15)).padding(.top,3)
                            }
                        }.frame(width: geo.size.width * 0.9, height: 100)
                        .padding(.top,15).padding(.bottom,15)
                        .overlay(Rectangle()
                                    .stroke(lineWidth: 0.5))
                        .foregroundColor(Color.white)
                        .background(Image("sport_sub2").resizable())
//                        .background(Color.gray).brightness(0.3)
                        
                        Button(action:{
                            
                        }){
                            VStack(alignment: .center) {
                                Text("재활센터(스포츠과학재활센터").font(.system(size:20))
                                Text("선수들의 경기력을 향상하고 \n 스포츠 과학을 지원합니다.")
//                                    .foregroundColor(.secondary)
                                    .font(.system(size:15)).padding(.top,3)
                            }
                        }.frame(width: geo.size.width * 0.9, height: 100)
                        .padding(.top,15).padding(.bottom,15)
                        .overlay(Rectangle()
                                    .stroke(lineWidth: 0.5))
                        .foregroundColor(Color.white)
                        .background(Image("sport_sub3").resizable())
//                        .background(Color.gray).brightness(0.3)
                        
                    }
                }
            }
        }
    }
}
