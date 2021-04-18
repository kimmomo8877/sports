//
//  SearchResultView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/13.
//


import SwiftUI
import MapKit
import PartialSheet

struct SearchResultView: View {
    
    @EnvironmentObject var searchViewModel: SearchViewModel
    @EnvironmentObject var infraViewModel: InfraViewModel
    @EnvironmentObject var codeViewModel: CodeViewModel
    @EnvironmentObject var teamViewModel: TeamViewModel
    @EnvironmentObject var teamDetailViewModel: TeamDetailViewModel
    @EnvironmentObject var partialSheetManager: PartialSheetManager
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
    @State private var isMapShowing = false
    
    var body: some View {
        GeometryReader { geo in
            VStack() {
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
                    }.frame(width: geo.size.width/4)
                    //            .padding(.leading, 20)
                    
//                    Spacer()
                    
                    Button(action: {
                        changeList = true
                    }) {
                        Text("스포츠팀\(self.searchViewModel.searchTeam.count)").font(.system(size:20)).fontWeight(.bold)
                    }.frame(width: geo.size.width/4)
                    //            .padding(.leading, 20)
                    
                    Spacer()
                    
                    NavigationLink(destination: SearchResultMapView(), isActive: $isMapShowing) {
                        Button(action: {
                            isMapShowing = true
                            var infras = [InfraModel]()
                            var locations = [MKPointAnnotation]()
                            
                            for (infra) in self.searchViewModel.searchInfra {
                                infras.append(infra)
                                annotation.title = infra.name ?? ""
                                annotation.subtitle = infra.address ?? ""
                                annotation.coordinate = CLLocationCoordinate2D(
                                    latitude: infra.latitude ?? infra.latitude ?? 0,
                                    longitude: infra.longitude ?? infra.longitude ?? 0)
                                locations.append(annotation)
                            }
                            
                            self.infraViewModel.setInfras(infraObject: infras)
                            self.infraViewModel.setMaps(locations: locations)
                            
                        }) {
                            Image(systemName: "map")
                            Text("지도")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }.frame(width: geo.size.width/5)
                    //            .padding(.trailing, 30)
                    
                    //            Spacer()
                }
                
                HStack(alignment:.top) {
                    
                    if changeList {
                        
                        Button(action: {
                            
                            self.partialSheetManager.showPartialSheet({
                                self.searchViewModel.isRegionFilter(codes: self.codeViewModel.codeRegion)
                            }) {
                                ClassificationFilterView()
                            }
                        }) {
                            HStack() {
                                Text("구분")
                                Image(systemName: expand1 ? "chevron.up" : "chevron.down")
                                    .resizable()
                                    .frame(width: 13, height: 6)
                            }
                            .frame(width:80, height:30)
                            .background(Color.white)
                            .overlay(Rectangle()
                                        .stroke(lineWidth: 0.5))
                        }.padding(.leading, 20).padding(.top,8).padding(.bottom,8)
                    }
                    
                    Button(action: {
                        
                        self.partialSheetManager.showPartialSheet({
                            self.searchViewModel.isSportFilter(codes: self.codeViewModel.codeSport)
                        }) {
                            SportFilterView()
                        }
                    }) {
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
                    }.padding(.leading, 20).padding(.top,8).padding(.bottom,8)
                    
                    
                    Button(action: {
                        
                        self.partialSheetManager.showPartialSheet({
                            self.searchViewModel.isRegionFilter(codes: self.codeViewModel.codeRegion)
                        }) {
                            RegionFilterView()
                        }
                    }) {
                        HStack() {
                            Text("지역")
                            Image(systemName: expand1 ? "chevron.up" : "chevron.down")
                                .resizable()
                                .frame(width: 13, height: 6)
                        }
                        .frame(width:80, height:30)
                        .background(Color.white)
                        .overlay(Rectangle()
                                    .stroke(lineWidth: 0.5))
                    }.padding(.leading, 20).padding(.top,8).padding(.bottom,8)
                    
                    
                    Spacer()
                }
                .background(Color.gray).brightness(0.4)
                
                
                ScrollView() {
                    
                    VStack {
                        if !changeList {
                            ForEach(self.searchViewModel.searchInfra, id: \.self) { searchModel in
                                
                                NavigationLink(destination: FacilityMapView(), isActive: $isInfraShowing) {
                                    
                                    Button(action: {
                                        isInfraShowing = true
                                        self.infraViewModel.setInfra(infraObject: searchModel)
                                        annotation.title = searchModel.name ?? ""
                                        annotation.subtitle = searchModel.address ?? ""
                                        annotation.coordinate = CLLocationCoordinate2D(
                                            latitude: searchModel.latitude ?? searchModel.latitude ?? 0,
                                            longitude: searchModel.longitude ?? searchModel.longitude ?? 0)
                                        self.infraViewModel.setMap(annotation: annotation)
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
                                
                                NavigationLink(destination: TeamDetailView(), isActive: $isTeamShowing) {
                                    //
                                    Button(action: {
                                        isTeamShowing = true
//                                        self.teamViewModel.callTeam(teamCode: searchModel.teamNo!)
                                        self.teamViewModel.setTeam(teamObject: searchModel)
                                        self.teamDetailViewModel.setNoticeBoard(teamModel: searchModel)
                                        self.teamDetailViewModel.setReservationBoard(teamModel: searchModel)
                                        self.teamDetailViewModel.setTeamSchedule(teamModel: searchModel)
                                        self.teamDetailViewModel.setTeamStory(teamModel: searchModel)
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
                }
            }
        }.padding(.bottom, 20)
    }
}

//                                ForEach(self.searchViewModel.searchInfra, id: \.self) { searchModel in
//                                    self.infraViewModel.setInfras(infraObject: searchModel)
//                                    self.infraViewModel.setInfras(infraObject: searchModel)
//                                }

//                                ForEach(self.searchViewModel.searchInfra.indices) { index in
//                                    infras.append(self.searchViewModel.searchInfra[index])
//                                }

//                                self.infraViewModel.setInfra(infraObject: searchModel)
//                                annotation.title = searchModel.name ?? ""
//                                annotation.subtitle = searchModel.address ?? ""
//                                annotation.coordinate = CLLocationCoordinate2D(
//                                    latitude: searchModel.latitude ?? searchModel.latitude ?? 0,
//                                    longitude: searchModel.longitude ?? searchModel.longitude ?? 0)
//                                self.infraViewModel.setMap(annotation: annotation)


//                    .onTapGesture {
//                                            if self.selectedPlatforms.contains(platform.id) {
//                                                self.selectedPlatforms.removeAll(where: { $0 == platform.id })
//                                            }
//                                            else {
//                                                self.selectedPlatforms.append(platform.id)
//                                            }
//                                    }



//                                annotation.title = searchModel.name ?? ""
//                                annotation.subtitle = searchModel.address ?? ""
//                                annotation.coordinate = CLLocationCoordinate2D(
//                                    latitude: searchModel.latitude ?? 35.106826,
//                                    longitude: searchModel.longitude ?? 128.988596)
//                                self.infraViewModel.set_map(annotation: annotation)

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



//            VStack() {
//                VStack(spacing: 5) {
//                    HStack() {
//                        Text("종목")
//                        Image(systemName: expand1 ? "chevron.up" : "chevron.down")
//                            .resizable()
//                            .frame(width: 13, height: 6)
//                    }
//                    .frame(width:80, height:30)
//                    .background(Color.white)
//                    .overlay(Rectangle()
//                                .stroke(lineWidth: 0.5))
//                    .onTapGesture {
//                        self.expand1.toggle()
//                    }
//                    if expand1 {
//                        Button(action: {
//                            self.expand1.toggle()
//                        }) {
//                            Text("축구").padding(5)
//                        }
//                        Button(action: {
//                            self.expand1.toggle()
//                        }) {
//                            Text("야구").padding(5)
//                        }
//                    }
//                }
//
//            }.padding(.leading, 20).padding(.top,8).padding(.bottom,8)

