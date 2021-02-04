//
//  TeamSearch.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/16.
//

import SwiftUI
import MapKit

struct TeamSearchView: View {
    
    @EnvironmentObject var searchViewModel: SearchViewModel
    @EnvironmentObject var infraViewModel: InfraViewModel
    @EnvironmentObject var codeViewModel: CodeViewModel
    @EnvironmentObject var teamViewModel: TeamViewModel
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var isInfraShowing = false
    @State private var isTeamShowing = false
    @State private var annotation = MKPointAnnotation()
    @State private var selection:String? = nil
    
    @State private var expand1 = false
    @State private var expand2 = false
    @State private var changeList = false
    
    var body: some View {
        
        HStack(){
            
            NavigationLink(destination: SearchBarView()) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 4)
                
                Text("시설이나 팀을 검색해 보세요")
                    .foregroundColor(.secondary)
                
            }.padding(.bottom,10).padding(.top,10).padding(.leading,60).padding(.trailing,50)
            .overlay(Rectangle().stroke(lineWidth: 0.5))
            .navigationBarTitle("검색결과", displayMode: .inline)
            
        }
        .padding(10)
        
        HStack() {
            Button(action: {
                changeList = false
            }) {
                Text("시설\(self.searchViewModel.searchInfra.count)").font(.system(size:20)).fontWeight(.bold)
            }.padding(.leading, 20)
            
            Button(action: {
                changeList = true
            }) {
                Text("스포츠팀\(self.searchViewModel.searchTeam.count)").font(.system(size:20)).fontWeight(.bold)
            }.padding(.leading, 20)
            Spacer()
        }
        
        HStack(alignment:.top) {
            
            VStack() {
                VStack(spacing: 5) {
                    HStack() {
                        Text("종목")
                        Image(systemName: expand1 ? "chevron.up" : "chevron.down")
                            .resizable()
                            .frame(width: 13, height: 6)
                    }
                    .frame(width:80, height:30)
                    .background(Color.white)
                    .overlay(Rectangle()
                                .stroke(lineWidth: 0.5))
                    .onTapGesture {
                        self.expand1.toggle()
                    }
                    if expand1 {
                        Button(action: {
                            self.expand1.toggle()
                        }) {
                            Text("축구").padding(5)
                        }
                        Button(action: {
                            self.expand1.toggle()
                        }) {
                            Text("야구").padding(5)
                        }
                    }
                }
                
            }.padding(.leading, 20).padding(.top,8).padding(.bottom,8)
            
            VStack() {
                VStack(spacing: 5) {
                    HStack() {
                        Text("지역")
                        Image(systemName: expand2 ? "chevron.up" : "chevron.down")
                            .resizable()
                            .frame(width: 13, height: 6)
                    }
                    .frame(width:80, height:30)
                    .background(Color.white)
                    .overlay(Rectangle()
                                .stroke(lineWidth: 0.5)
                             
                    )
                    //                    .cornerRadius(5)
                    .onTapGesture {
                        self.expand2.toggle()
                    }
                    if expand2 {
                        Button(action: {
                            self.expand2.toggle()
                        }) {
                            Text("창원").padding(5)
                        }
                        Button(action: {
                            self.expand2.toggle()
                        }) {
                            Text("거제도").padding(5)
                        }
                    }
                }
                
            }.padding(.leading, 10).padding(.top,8).padding(.bottom,8)
            Spacer()
        }
        //        .frame(height:50)
        .background(Color.gray).brightness(0.4)
        
        
        ScrollView() {
            
            VStack {
                if !changeList {
                    ForEach(self.searchViewModel.searchInfra, id: \.self) { searchModel in
                        
                        NavigationLink(destination: TeamMapView(), isActive: $isInfraShowing) {
                            
                            Button(action: {
                                isInfraShowing = true
                                self.infraViewModel.set_infra(infraObject: searchModel)
                                annotation.title = searchModel.name ?? ""
                                annotation.subtitle = searchModel.address ?? ""
                                annotation.coordinate = CLLocationCoordinate2D(
                                    latitude: searchModel.latitude ?? 35.106826,
                                    longitude: searchModel.longitude ?? 128.988596)
                                self.infraViewModel.set_map(annotation: annotation)
                            }) {
                                HStack {
                                    if searchModel.attachFiles!.count > 0 {
                                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + searchModel.attachFiles![0].saveFilePath!, title: "", width: 50, height: 50)
                                    } else {
                                        Image("search_default_image")
                                            .resizable()
                                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }
                                    VStack {
                                        Text("\(searchModel.name ?? "")")
                                        Text("\(searchModel.address ?? "")").foregroundColor(.secondary)
                                            .font(Font.system(size:15))
                                    }
                                }.padding(.leading, 10)
                                Spacer()
                            }
                        }
                    }
                    
                }
                else {


                    ForEach(self.searchViewModel.searchTeam, id: \.self) { searchModel in

                        NavigationLink(destination: TeamMapView(), isActive: $isTeamShowing) {
//
                            Button(action: {
                                isTeamShowing = true
                                self.teamViewModel.set_team(teamObject: searchModel)
//                                annotation.title = searchModel.name ?? ""
//                                annotation.subtitle = searchModel.address ?? ""
//                                annotation.coordinate = CLLocationCoordinate2D(
//                                    latitude: searchModel.latitude ?? 35.106826,
//                                    longitude: searchModel.longitude ?? 128.988596)
//                                self.infraViewModel.set_map(annotation: annotation)
                            }) {
                                HStack {
//                                    if searchModel.attachFiles!.count > 0 {
//                                        ImageCellSearch(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + searchModel.attachFiles![0].saveFilePath!, title: "")
//                                    } else {
                                        Image("search_default_image")
                                            .resizable()
                                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                    }
                                    VStack {
                                        Text("\(searchModel.name ?? "")")
//                                        Text("\(searchModel.name ?? "")").foregroundColor(.secondary)
                                    }
                                }.padding(.leading, 10)
                                Spacer()
                            }

                        }
                        
                    }
                }
            }
        }.padding(.bottom, 20)
    }
}




//                                self.infraViewModel.search_infra(searchWord: searchModel.searchItemNo!)
//
//                                if self.infraViewModel.infraModel.count > 0 {
//                                    annotation.title = self.infraViewModel.infraModel[0].name ?? ""
//                                    annotation.subtitle = self.infraViewModel.infraModel[0].address ?? ""
//                                    annotation.coordinate = CLLocationCoordinate2D(latitude: self.infraViewModel.infraModel[0].latitude ?? 35.106826,  longitude: self.infraViewModel.infraModel[0].longitude ?? 128.988596)
////                                    self.locations.append(annotation)
//                                    self.infraViewModel.set_map(annotation: annotation)
//                                }





//                    NavigationLink(destination: MapView(centerCoordinate: $centerCoordinate, annotations: locations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails), isActive: $isShowing) {




//        HStack() {
//            Spacer()
//            NavigationLink(destination: MapView(centerCoordinate: $centerCoordinate, annotations: locations, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails), isActive: $isShowing) {
//                Button(action: {
//                    isShowing = true
//                }) {
//                    Image(systemName: "map")
//                    Text("지도보기")
//                }
//                .padding(.trailing, 10)
//                .transition(.move(edge: .trailing))
//                .animation(.default)
//            }.padding(.trailing, 30)
//            .padding(.bottom, 25)
//        }



//            Menu(content: {
//                Button(action: {
//
//                }, label: {
//                    Label("text",systemImage: "flame.fill")
//                })
//            }, label: {
//                //                Circle().foregroundColor(Color.yellow)
//                //                    .frame(width:50, height:50)
//                Text("종목")
//            })
//
//            Menu(content: {
//                Button(action: {
//
//                }, label: {
//                    Label("text",systemImage: "flame.fill")
//                })
//            }, label: {
//                Text("지역")
//            })
//        }
