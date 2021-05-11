//
//  FacilityDetailView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/13.
//


import SwiftUI
import PartialSheet
import MapKit

struct FacilityDetailView: View {
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @EnvironmentObject var infraViewModel:InfraViewModel
    @ObservedObject var loginViewModel:LoginViewModel = LoginViewModel.shared
    @State private var showingSheet = true
    @State private var isReservationShowing = false
    @State private var isCallShowing = false
    @State private var isSearchShowing = false
    @State private var isSaveShowing = false
    @State private var annotation = MKPointAnnotation()
    var infraModel: InfraModel
    
    var body: some View {
        GeometryReader { geo in
            VStack() {
                ScrollView (.horizontal, showsIndicators: false) {
                    
                    HStack {
                        if (infraViewModel.infraObject[0].attachFiles!.count > 0) {
                            ForEach(infraViewModel.infraObject[0].attachFiles!, id: \.self) {
                                infraModel in
                                ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "", width: geo.size.width, height:150)
                            }
                        } else {
                            HomeImageView(image: "search_default_image", width: geo.size.width, height:150)
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
                                
                                Button(action: {
                                    if infraViewModel.infraObject[0].phoneNumber != nil {
                                        let telephone = "tel://"
                                        let formattedString = telephone + infraViewModel.infraObject[0].phoneNumber!
                                        guard let url = URL(string: formattedString) else { return }
                                        UIApplication.shared.open(url)
                                    } else {
                                        
                                    }
                                    
                                    
                                }) {
                                    VStack() {
                                        Image(systemName: "phone.fill")
                                        Text("문의").font(Font.system(size:15))
                                    }.frame(width: geo.size.width /  5, height: 60)
                                    .overlay(Rectangle().stroke(lineWidth: 0.5))
                                }
                                //                                }
                                
                                NavigationLink(destination: FacilityMapView(), isActive: $isSearchShowing) {
                                    Button(action: {
                                        isSearchShowing = true
                                        annotation.title = infraViewModel.infraObject[0].name ?? ""
                                        annotation.subtitle = infraViewModel.infraObject[0].address ?? ""
                                        annotation.coordinate = CLLocationCoordinate2D(
                                            latitude: infraViewModel.infraObject[0].latitude ?? infraViewModel.infraObject[0].latitude ?? 0,
                                            longitude: infraViewModel.infraObject[0].longitude ?? infraViewModel.infraObject[0].longitude ?? 0)
                                        //                                    latitude: searchModel.latitude ?? 35.106826,
                                        //                                    longitude: searchModel.longitude ?? 128.988596)
                                        self.infraViewModel.setMap(annotation: annotation)
                                    }) {
                                        VStack() {
                                            Image(systemName: "map.fill")
                                            Text("길찾기").font(Font.system(size:15))
                                        }.frame(width: geo.size.width / 5, height: 60)
                                        .overlay(Rectangle().stroke(lineWidth: 0.5))
                                    }
                                }
                                
                                NavigationLink(destination: FacilityMapView(), isActive: $isSaveShowing) {
                                    Button(action: {
                                        isSaveShowing = true
                                    }) {
                                        VStack() {
                                            Image(systemName: "square.and.arrow.down.fill")
                                            Text("영상").font(Font.system(size:15))
                                        }.frame(width: geo.size.width / 5, height: 60)
                                        .overlay(Rectangle().stroke(lineWidth: 0.5))
                                    }
                                }
                                
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
                            Text(infraViewModel.infraObject[0].facilityDescription ?? "").padding(.leading, 20).padding(.top,1).foregroundColor(.secondary)
                            VStack { Divider().background(Color.gray) }.padding(CGFloat(10)).foregroundColor(.secondary)
                        }
                        
                        Group {
                            Text("부속시설").padding(.leading, 20).font(.system(size:21)).font(.system(size:20))
                            Text(infraViewModel.infraObject[0].equipmentDescription ?? "").padding(.leading, 20).padding(.top,1).foregroundColor(.secondary)
                            VStack { Divider().background(Color.gray) }.padding(CGFloat(10)).foregroundColor(.secondary)
                        }
                        Group {
                            Text("기타 부대시설").padding(.leading, 20).font(.system(size:21)).font(.system(size:20))
                            Text(infraViewModel.infraObject[0].etcDescription ?? "").padding(.leading, 20).padding(.top,1).foregroundColor(.secondary)
                            VStack { Divider().background(Color.gray) }.padding(CGFloat(10)).foregroundColor(.secondary)
                        }
                        Group {
                            Text("위치").padding(.leading, 20).font(.system(size:21)).font(.system(size:20))
                            Text(infraViewModel.infraObject[0].address ?? "").padding(.leading, 20).padding(.top,3).foregroundColor(.secondary)
                            VStack { Divider().background(Color.gray) }.padding(CGFloat(10)).foregroundColor(.secondary)
                            
                            Text("요금").padding(.leading, 20).font(Font.body.bold())
                            
                        }
                    }
                }
            }
        }
    }
}
