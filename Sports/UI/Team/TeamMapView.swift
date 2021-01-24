//
//  TeamSearch.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/16.
//

import SwiftUI
import MapKit

struct TeamMapView: View {
    
    var searchModel: SearchModel
    var locations: [MKPointAnnotation]
    @State private var centerCoordinate = CLLocationCoordinate2D()
//    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var isShowing = false
    @State private var annotation = MKPointAnnotation()
    @State private var selection:String? = nil
    
    var body: some View {
        
        VStack() {
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
            .padding(10)
            
            MapView(centerCoordinate: $centerCoordinate, annotations: self.locations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails)
            
            Text(searchModel.name!)
            Text(searchModel.name!)
            
            NavigationLink(destination: TeamDetailSport(), tag : "First", selection: $selection) {
                EmptyView()
            }
            NavigationLink(destination: Text(verbatim: "dd"), tag : "Second", selection: $selection) {
                EmptyView()
            }
            NavigationLink(destination: Text(verbatim: "dd"), tag : "Third", selection: $selection) {
                EmptyView()
            }
            NavigationLink(destination: Text(verbatim: "dd"), tag : "Four", selection: $selection) {
                EmptyView()
            }
            HStack() {
                Button("Fisrt") { self.selection = "First" }
                Button("Second") { self.selection = "First" }
                Button("Third") { self.selection = "First" }
                Button("Four") { self.selection = "First" }
            }

            
        }
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
    }
}



