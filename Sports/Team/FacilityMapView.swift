//
//  FacilityMapView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/13.
//


import SwiftUI
import MapKit
import PartialSheet
struct FacilityMapView: View {
    
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @EnvironmentObject var infraViewModel: InfraViewModel
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    @ObservedObject var loginViewModel:LoginViewModel = LoginViewModel.shared
    @State private var centerCoordinate = CLLocationCoordinate2D()
//    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var isShowing = false
    @State private var annotation = MKPointAnnotation()
    @State private var selection:String? = nil
    @State private var isReservationShowing = false
    @State private var isCallShowing = false
    @State private var isSearchShowing = false
    @State private var isSaveShowing = false
    
    var body: some View {
        GeometryReader { geo in
        VStack(alignment: .leading) {
            
            Group {
                        
                MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails)
                
                
                NavigationLink(destination: FacilityDetailView(infraModel: self.infraViewModel.infraObject[0]), isActive: $isShowing) {
                    Button(action: {
                        self.isShowing = true
//                        self.infraViewModel.set_infra(infraObject: infraSportModel)
                    }) {
                        if self.infraViewModel.infraObject.count > 0 {
                            Text(self.infraViewModel.infraObject[0].name ?? "").padding(.leading,20).padding(.top,5)
                            Text(self.infraViewModel.infraObject[0].address ?? "").foregroundColor(.secondary).padding(.leading,20).font(Font.system(size:15))
                        }
                    }
                }
                .navigationBarTitle("위치검색", displayMode: .inline)
                
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
                                Text("저장").font(Font.system(size:15))
                            }.frame(width: geo.size.width / 5, height: 60)
                            .overlay(Rectangle().stroke(lineWidth: 0.5))
                        }
                    }
                }.padding(.bottom,10).padding(.leading,40)
                
            }
        }
        }
        
    }
    
}

//            NavigationLink(destination: TeamDetailSportView(), isActive: $isShowing) {
//                Button(action: {
//                    self.isShowing = true
//                }) {
//                    Text("First")
//                }
////                .padding(.trailing, 10)
////                .transition(.move(edge: .trailing))
////                .animation(.default)
//            }.navigationBarTitle("Navigation", displayMode: .inline)
//            .addPartialSheet()

//                Button(action: {
//                    isShowing = true
//                    annotation.title = "London"
//                    annotation.subtitle = "Home to the 2012 Summer Olympics."
//                    annotation.coordinate = CLLocationCoordinate2D(latitude: 128.6635024, longitude: 35.1459809)
//                    self.locations.append(annotation)
//                    print(self.searchModel)
//                    annotation.title = "Test"
//                    annotation.subtitle = "Test 1234"
//                    annotation.coordinate = self.centerCoordinate
//                    self.locations.append(annotation)
//
//                }) {
//
//                }
