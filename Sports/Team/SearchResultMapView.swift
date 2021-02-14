//
//  SearchResultMapView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/14.
//



import SwiftUI
import MapKit
import PartialSheet
struct SearchResultMapView: View {
    
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
                
            }
//
//            Group {
//
//                HStack(spacing:0) {
//
//                    NavigationLink(destination: ReservationView(), isActive: $isReservationShowing) {
//                        Button(action: {
//                            if (self.loginViewModel.isLogined) {
//                                isReservationShowing = true
//                            } else {
//
//                                self.partialSheetManager.showPartialSheet({
//                                    let userNoData: String? = UserDefaults.standard.string(forKey: "userNo")
//                                    guard let userNo = userNoData else { return }
//                                    self.loginViewModel.getTargetList(userNo: userNo)
//                                }) {
//                                    LoginView()
//                                }
//                            }
//
//                        }) {
//                            VStack() {
//                                Image(systemName: "book.fill")
//                                Text("예약").font(Font.system(size:15))
//                            }.frame(width: geo.size.width / 5 , height: 60)
//                            .overlay(Rectangle().stroke(lineWidth: 0.5))
//                        }
//                    }
//
//                        Button(action: {
//                            if infraViewModel.infraObject[0].phoneNumber != nil {
//                                let telephone = "tel://"
//                                let formattedString = telephone + infraViewModel.infraObject[0].phoneNumber!
//                                guard let url = URL(string: formattedString) else { return }
//                                UIApplication.shared.open(url)
//                            } else {
//
//                            }
//
//
//                        }) {
//                            VStack() {
//                                Image(systemName: "phone.fill")
//                                Text("문의").font(Font.system(size:15))
//                            }.frame(width: geo.size.width /  5, height: 60)
//                            .overlay(Rectangle().stroke(lineWidth: 0.5))
//                        }
////                                }
//
//                    NavigationLink(destination: FacilityMapView(), isActive: $isSearchShowing) {
//                        Button(action: {
//                            isSearchShowing = true
//                        }) {
//                            VStack() {
//                                Image(systemName: "map.fill")
//                                Text("길찾기").font(Font.system(size:15))
//                            }.frame(width: geo.size.width / 5, height: 60)
//                            .overlay(Rectangle().stroke(lineWidth: 0.5))
//                        }
//                    }
//
//                    NavigationLink(destination: FacilityMapView(), isActive: $isSaveShowing) {
//                        Button(action: {
//                            isSaveShowing = true
//                        }) {
//                            VStack() {
//                                Image(systemName: "square.and.arrow.down.fill")
//                                Text("저장").font(Font.system(size:15))
//                            }.frame(width: geo.size.width / 5, height: 60)
//                            .overlay(Rectangle().stroke(lineWidth: 0.5))
//                        }
//                    }
//                }.padding(.bottom,10).padding(.leading,40)
//
//            }
//        }
        }

    }
    }
}


