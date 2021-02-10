//
//  TeamDetailFacility.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/23.
//

import SwiftUI
import PartialSheet

struct TeamDetailFacilityView: View {
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @EnvironmentObject var infraViewModel:InfraViewModel
    @ObservedObject var loginViewModel:LoginViewModel = LoginViewModel.shared
    @State private var showingSheet = true
    @State private var isReservationShowing = false
    @State private var isCallShowing = false
    @State private var isSearchShowing = false
    @State private var isSaveShowing = false
    
    var infraModel: InfraModel
    
    var body: some View {
        GeometryReader { geo in
            VStack() {
                ScrollView (.horizontal, showsIndicators: false) {
                    
                    HStack {
                        ForEach(infraViewModel.infraObject[0].attachFiles!, id: \.self) {
                            infraModel in
                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "", width: geo.size.width, height:150)
                        }
                    }
                }.padding(.bottom, 10)
                
                ScrollView() {
                    
                    VStack(alignment: .leading) {
                        Group {
                            //                        let testtest = infraViewModel.infraObject
                            Text(infraViewModel.infraObject[0].name ?? "").padding(.leading, 20)
                                .padding(.bottom,5)
                                .font(.system(size:25))
                            //                        Text("200km | 축구").padding(.leading, 20).foregroundColor(.secondary)
                        }
                        Group {
                            HStack(spacing:0) {
                                
                                NavigationLink(destination: ReservationView(), isActive: $isReservationShowing) {
                                    Button(action: {
                                        if (self.loginViewModel.isLogined) {
                                            isReservationShowing = true
                                        } else {
                                            
                                            self.partialSheetManager.showPartialSheet({
                                                let userNoData: String? = UserDefaults.standard.string(forKey: "userNo")
                                                guard let userNo = userNoData else { return }
                                                self.loginViewModel.getTargetList(userNo: userNo)
                                            }) {
                                                LoginView()
                                            }
                                        }
                                
                                    }) {
                                        VStack() {
                                            Image(systemName: "book.fill")
                                            Text("예약").font(Font.system(size:15))
                                        }.frame(width: geo.size.width / 5 , height: 60)
                                        .overlay(Rectangle().stroke(lineWidth: 0.5))
                                    }
                                }
                                
                                NavigationLink(destination: TeamMapView(), isActive: $isCallShowing) {
                                    Button(action: {
                                        isCallShowing = true
                                    }) {
                                        VStack() {
                                            Image(systemName: "phone.fill")
                                            Text("문의").font(Font.system(size:15))
                                        }.frame(width: geo.size.width /  5, height: 60)
                                        .overlay(Rectangle().stroke(lineWidth: 0.5))
                                    }
                                }
                                
                                NavigationLink(destination: TeamMapView(), isActive: $isSearchShowing) {
                                    Button(action: {
                                        isSearchShowing = true
                                    }) {
                                        VStack() {
                                            Image(systemName: "map.fill")
                                            Text("길찾기").font(Font.system(size:15))
                                        }.frame(width: geo.size.width / 5, height: 60)
                                        .overlay(Rectangle().stroke(lineWidth: 0.5))
                                    }
                                }
                                
                                NavigationLink(destination: TeamMapView(), isActive: $isSaveShowing) {
                                    Button(action: {
                                        isSaveShowing = true
                                    }) {
                                        VStack() {
                                            Image(systemName: "square.and.arrow.down.fill")
                                            Text("저장").font(Font.system(size:15))
                                        }.frame(width: geo.size.width / 5, height: 60)
                                        .overlay(Rectangle().stroke(lineWidth: 0.5))
                                    }
                                }
                                
                                
                                
                                
                                
                                
                                
                                //                                Button(action: {
                                //
                                //                                }){
                                //                                    VStack() {
                                //                                        Image(systemName: "book.fill")
                                //                                        Text("예약").font(Font.system(size:15))
                                //                                    }.frame(width: geo.size.width / 5 , height: 60)
                                //                                    .overlay(Rectangle().stroke(lineWidth: 0.5))
                                //                                }
                                //
                                //                                Button(action: {
                                //
                                //                                }){
                                //                                    VStack() {
                                //                                        Image(systemName: "phone.fill")
                                //                                        Text("문의").font(Font.system(size:15))
                                //                                    }.frame(width: geo.size.width /  5, height: 60)
                                //                                    .overlay(Rectangle().stroke(lineWidth: 0.5))
                                //                                }
                                //                                Button(action: {
                                //
                                //                                }){
                                //                                    VStack() {
                                //                                        Image(systemName: "map.fill")
                                //                                        Text("길찾기").font(Font.system(size:15))
                                //                                    }.frame(width: geo.size.width / 5, height: 60)
                                //                                    .overlay(Rectangle().stroke(lineWidth: 0.5))
                                //                                }
                                //                                Button(action: {
                                //
                                //                                }){
                                //                                    VStack() {
                                //                                        Image(systemName: "square.and.arrow.down.fill")
                                //                                        Text("저장").font(Font.system(size:15))
                                //                                    }.frame(width: geo.size.width / 5, height: 60)
                                //                                    .overlay(Rectangle().stroke(lineWidth: 0.5))
                                //                                }
                                //                                Spacer()
                                
                            }.padding(.bottom,10).padding(.leading,40)
                            
                        }
                        Group {
                            HStack() {
                                Text("주소").padding(.leading, 20).foregroundColor(.secondary)
                                // font(Font.body.bold()).
                                Text(infraViewModel.infraObject[0].address ?? "").padding(.leading, 33)
                                Spacer()
                            }
                            HStack() {
                                Text("홈페이지").padding(.leading, 20).foregroundColor(.secondary)
                                Text(infraViewModel.infraObject[0].homepageUrl ?? "").padding(.leading, 8)
                                Spacer()
                            }.padding(.top,1)
                            HStack() {
                                Text("전화").padding(.leading, 20).foregroundColor(.secondary)
                                Text(infraViewModel.infraObject[0].phoneNumber ?? "").padding(.leading, 33)
                                Spacer()
                            }.padding(.top,1)
                            
                            VStack { Divider().background(Color.gray) }.padding(CGFloat(10)).foregroundColor(.secondary)
                            
                        }
                        
                        Group {
                            Text("스포츠시설").padding(.leading, 20).font(.system(size:21)).font(.system(size:20))
                            Text(infraViewModel.infraObject[0].facilityDescription ?? "").padding(.leading, 20).padding(.top,1)
                            VStack { Divider().background(Color.gray) }.padding(CGFloat(10)).foregroundColor(.secondary)
                        }
                        
                        Group {
                            Text("부속시설").padding(.leading, 20).font(.system(size:21)).font(.system(size:20))
                            Text(infraViewModel.infraObject[0].equipmentDescription ?? "").padding(.leading, 20).padding(.top,1)
                            VStack { Divider().background(Color.gray) }.padding(CGFloat(10)).foregroundColor(.secondary)
                        }
                        Group {
                            Text("기타 부대시설").padding(.leading, 20).font(.system(size:21)).font(.system(size:20))
                            Text(infraViewModel.infraObject[0].etcDescription ?? "").padding(.leading, 20).padding(.top,1)
                            VStack { Divider().background(Color.gray) }.padding(CGFloat(10)).foregroundColor(.secondary)
                        }
                        Group {
                            Text("위치").padding(.leading, 20).font(.system(size:21)).font(.system(size:20))
                            Text(infraViewModel.infraObject[0].address ?? "").padding(.leading, 20).padding(.top,3)
                            VStack { Divider().background(Color.gray) }.padding(CGFloat(10)).foregroundColor(.secondary)
                            
                            Text("요금").padding(.leading, 20).font(Font.body.bold())
                            
                        }
                    }
                }
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


//                        Path { path in
//                            path.move(to: CGPoint(x: 20, y: 700))
//                            path.addLine(to:CGPoint(x:20, y: 700))
//                            path.addLine(to: CGPoint(x:geo.size.width, y: 700))
//                        }
//                        .stroke(Color.blue, lineWidth: 10)


