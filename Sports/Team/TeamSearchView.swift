//
//  TeamSearch.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/16.
//

import SwiftUI
import MapKit

struct TeamSearchView: View {
    
    @ObservedObject var searchViewModel: SearchViewModel
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var isShowing = false
    @State private var annotation = MKPointAnnotation()
    @State private var selection:String? = nil
    
    init(searchWord:String) {
        searchViewModel = SearchViewModel(searchWord:searchWord)
    }
    
    var body: some View {
        
        //        NavigationView {
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
        
        HStack() {
            
            Button(action: {
                
            }) {
                Text("시설")
            }
            
            Button(action: {
                
            }) {
                Text("스포츠")
            }
        }
        
        HStack() {
            
            Menu(content: {
                Button(action: {
                    
                }, label: {
                    Label("text",systemImage: "flame.fill")
                })
            }, label: {
                //                Circle().foregroundColor(Color.yellow)
                //                    .frame(width:50, height:50)
                Text("종목")
            })
            
            Menu(content: {
                Button(action: {
                    
                }, label: {
                    Label("text",systemImage: "flame.fill")
                })
            }, label: {
                Text("지역")
            })
        }
        Text("Some horizontalView3")
        ScrollView() {
            
            VStack {
                ForEach(self.searchViewModel.searchModel, id: \.self) { searchModel in
//                    NavigationLink(destination: MapView(centerCoordinate: $centerCoordinate, annotations: locations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails), isActive: $isShowing) {
                    NavigationLink(destination: TeamMapView(searchModel: searchModel, locations: locations), isActive: $isShowing) {
                        
//                        NavigationLink(destination: TeamMapView(searchModel: searchData, locations: locations), tag : "First", selection: $selection) {
//                            EmptyView()
//                        }
                        
                        Button(action: {
                            isShowing = true
                            annotation.title = "London"
                            annotation.subtitle = "Home to the 2012 Summer Olympics."
                            annotation.coordinate = CLLocationCoordinate2D(latitude: 128.6635024, longitude: 35.1459809)
                            self.locations.append(annotation)
                            print(self.searchViewModel.searchModel.count)
                            print(searchModel)
                            annotation.title = "Test"
                            annotation.subtitle = "Test 1234"
                            annotation.coordinate = self.centerCoordinate
                            self.locations.append(annotation)
                            self.selection = "First"
                        }) {
                            HStack {
                                Image("image")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                VStack {
                                    Text("\(searchModel.name ?? "")")
                                    Text("\(searchModel.name ?? "")")
                                }
                            }
                        }
                    }
                }
                
            }
        }
        
        NavigationLink(destination: MapView(centerCoordinate: $centerCoordinate, annotations: locations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails), isActive: $isShowing) {
            Button(action: {
                isShowing = true
            }) {
                Text("지도보기")
            }
            .padding(.trailing, 10)
            .transition(.move(edge: .trailing))
            .animation(.default)
        }
        
    }
}
