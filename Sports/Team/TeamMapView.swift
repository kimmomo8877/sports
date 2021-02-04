//
//  TeamSearch.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/16.
//

import SwiftUI
import MapKit
import PartialSheet
struct TeamMapView: View {
    
    @EnvironmentObject var partialSheet : PartialSheetManager
    @EnvironmentObject var infraViewModel: InfraViewModel
    @EnvironmentObject var searchViewModel: SearchViewModel
    @State private var centerCoordinate = CLLocationCoordinate2D()
//    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var isShowing = false
    @State private var annotation = MKPointAnnotation()
    @State private var selection:String? = nil
    
    var body: some View {
        GeometryReader { geo in
        VStack(alignment: .leading) {
            
            Group {
                        
                MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails)
                
                
                NavigationLink(destination: TeamDetailFacilityView(infraModel: self.infraViewModel.infraObject[0]), isActive: $isShowing) {
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
                    
                }.padding(.top,5).padding(.bottom,10).padding(.leading,40)
                //                NavigationLink(destination: TeamDetailSportView(infraModel: infraViewModel.infraModel), tag : "First", selection: $selection) {
                //                    infraViewModel.search_infra(searchWord: "e56065ff83")
                //                    EmptyView()
                //                }
                //                NavigationLink(destination: Text(verbatim: "dd"), tag : "Second", selection: $selection) {
                //                    EmptyView()
                //                }
                //                NavigationLink(destination: Text(verbatim: "dd"), tag : "Third", selection: $selection) {
                //                    EmptyView()
                //                }
                //                NavigationLink(destination: Text(verbatim: "dd"), tag : "Four", selection: $selection) {
                //                    EmptyView()
                //                }
                //                HStack() {
                //                    Button("Fisrt") { self.selection = "First" }
                //                    Button("Second") { self.selection = "Second" }
                //                    Button("Third") { self.selection = "Third" }
                //                    Button("Four") { self.selection = "Four" }
                //                }.padding(.leading,20)
                
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
