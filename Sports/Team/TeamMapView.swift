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
    
    var searchModel: SearchModel
    var locations: [MKPointAnnotation]
    @EnvironmentObject var partialSheet : PartialSheetManager
    @EnvironmentObject var infraViewModel: InfraViewModel
    @State private var centerCoordinate = CLLocationCoordinate2D()
    //    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var isShowing = false
    @State private var annotation = MKPointAnnotation()
    @State private var selection:String? = nil
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                HStack(){
                    
                    NavigationLink(destination: SearchBarView()) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 4)
                        
                        Text("시설이나 팀을 검색해 보세요")
                            //                                .padding(.left, -20)
                            .foregroundColor(.secondary)
                        
                    }.padding(.bottom,10).padding(.top,10).padding(.leading,60).padding(.trailing,50)
                    .overlay(Rectangle().stroke(lineWidth: 0.5))
                    
                }
                .padding(20)
            }
            Group {
                MapView(centerCoordinate: $centerCoordinate, annotations: self.locations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails)
                
                
                Text(searchModel.name!).padding(.leading,20).padding(.top,20)
                Text(searchModel.name!).foregroundColor(.secondary).padding(.leading,20).padding(.top,5)
            }
            
            Group {
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
