//
//  TeamDetailSport.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/23.
//

//
//  Home.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI
import PartialSheet

struct TeamDetailSportView: View {
    //    @EnvironmentObject var partialSheet : PartialSheetManager
    //    @ObservedObject private var infra = InfraViewModel()
    @State private var showingSheet = true
    
    var infraModel: InfraModel   
    
    var body: some View {
        
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    Image("image")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    Image("image")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    Image("image")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    Image("image")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    Image("image")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    
                }
            }
            .frame(height: 150)
            .padding(5)
        
        
        GeometryReader { geo in
            ScrollView() {
                VStack(alignment: .leading) {
                    Group {
                        //                    Text("창원축구센터 주경기장").padding(.leading, 20)
                        //                    Text("200km | 축구").padding(.leading, 20).foregroundColor(.secondary)
                        Text(infraModel.name!).padding(.leading, 20).font(.system(size:25))
                        Text("200km | 축구").padding(.leading, 20).foregroundColor(.secondary)
                    }
                    Group {
                        HStack(spacing:0) {
                            
                            Button(action: {
                                
                            }){
                                VStack() {
                                    Image(systemName: "book.fill")
                                    Text("예약").font(Font.system(size:15))
                                }.frame(width: geo.size.width / 5 , height: 60)
                                .overlay(Rectangle().stroke(lineWidth: 0.5))
                            }
                            Button(action: {
                                
                            }){
                                VStack() {
                                    Image(systemName: "phone.fill")
                                    Text("문의").font(Font.system(size:15))
                                }.frame(width: geo.size.width /  5, height: 60)
                                .overlay(Rectangle().stroke(lineWidth: 0.5))
                            }
                            Button(action: {
                                
                            }){
                                VStack() {
                                    Image(systemName: "map.fill")
                                    Text("길찾기").font(Font.system(size:15))
                                }.frame(width: geo.size.width / 5, height: 60)
                                .overlay(Rectangle().stroke(lineWidth: 0.5))
                            }
                            Button(action: {
                                
                            }){
                                VStack() {
                                    Image(systemName: "square.and.arrow.down.fill")
                                    Text("저장").font(Font.system(size:15))
                                }.frame(width: geo.size.width / 5, height: 60)
                                .overlay(Rectangle().stroke(lineWidth: 0.5))
                            }
                            Spacer()
                            
                        }.padding(.top,20).padding(.bottom,20).padding(.leading,40)
                        
                    }
                    Group {
                        HStack() {
                            Text("주소").padding(.leading, 20).font(Font.body.bold())
                            //                        Text("경남 성산시 창이대로 266-265").padding(.leading, 20)
                            Text(infraModel.address ?? "").padding(.leading, 20)
                            Spacer()
                        }
                        HStack() {
                            Text("홈페이지").padding(.leading, 20)
                            //                        Text("http://staet;f.dfdasfasd.fdsafdsafasd").padding(.leading, 20)
                            Text(infraModel.homepageUrl ?? "").padding(.leading, 20)
                            Spacer()
                        }
                        HStack() {
                            Text("전화").padding(.leading, 20)
                            //                        Text("055-235-2345").padding(.leading, 20)
                            Text(infraModel.phoneNumber ?? "").padding(.leading, 20)
                            Spacer()
                        }
                        
                        Text("                            ").underline()
                    }
                    Group {
                        Text("부속시설").padding(.leading, 20)
                        Text("주경기장, 보조경기장, 체력단력장, 세미나실, 숙소").padding(.leading, 20)
                        Text("                            ").underline()
                        Text("기타부속시설").padding(.leading, 20)
                        Text("편의점, 카페, 선수대기실, 심판실, 감독실, 치어리더실").padding(.leading, 20)
                        Text("                            ").underline()
                        Text("위치").padding(.leading, 20)
                        Text("경남 창원시 성산구 사파정동 비음로 97").padding(.leading, 20)
                        Text("                            ").underline()
                        Text("요금").padding(.leading, 20)
                        
                        
                    }
                }
                
            }
        }
        
        //        VStack(){
        //        self.partialSheet.showPartialSheet(){
        //                                                print("dismissed")
        //                                            }
        //        }
        //        Button(action: {
        //                                self.partialSheet.showPartialSheet({
        //                                    print("dismissed")
        //                                }) {
        //                                    Text("Partial Sheet")
        //                                }
        //                            }, label: {
        //                                Text("Show Partial Sheet")
        //                            }).addPartialSheet()
        
        
        //        Button(action:{
        //            //        self.infra.isDisplay(title: title)
        //
        //        }){
        //            Text("sheet")
        //        }.actionSheet(isPresented: $showingSheet) {
        //            ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
        //
        //        }
    }
    
}
