//
//  Home.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var infraViewModel:InfraViewModel
    @EnvironmentObject var infraCViewModel:InfraCategoryViewModel
    
    @State private var isTrackerShowing = false
    @State private var isSportShowing = false
    @State private var isHotelShowing = false
    @State private var isFoodShowing = false
    
    @State private var isLoading = true
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack() {
                    ScrollView() {
                        VStack {
                            Group {
                                ZStack (alignment:.top) {
                                    
                                    HomeImageView(image: "m-intro_bg", width: geo.size.width, height: 200)
                                    //                                    .padding(.top,10)
                                    HomeImageView(image: "logo-intro", width: geo.size.width / 2 , height: 100)
                                        .padding(.top,50)
                                    
                                    NavigationLink(destination: TrackingConfigView(), isActive: $isTrackerShowing) {
                                        
                                    }.navigationBarTitle("홈", displayMode: .inline)
                                    .navigationBarItems(trailing:
                                                            Button(action: {
                                                                self.isTrackerShowing = true
                                                            }) {
                                                                Spacer()
                                                                Text("트래커")
                                                                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                                    .padding(5)
                                                                    .foregroundColor(Color.white)
                                                                    .background(Color.black)
                                                                    .cornerRadius(15)
                                                            }
                                        .transition(.move(edge: .trailing))
                                                            .animation(.default)
                                    )
                                }
                            }
                            
                            Group {
                                ScrollView(.horizontal) {
                                    HStack(){
                                        HomeIntroView(title: "전지훈련팀 스포츠 투어링이 처음이신가요?", subTitle: "서비스소개 >", geo: geo)
                                        HomeIntroView(title: "모바일로 운동기록하고 위치기반 투어링을 추천 받아보세요.", subTitle: "모바일이용가이드 >",geo: geo)
                                        HomeIntroView(title: "운영센터", subTitle: "운영센터소개 >",geo: geo)
                                        
                                    }
                                    .padding(10)
                                    .cornerRadius(10)
                                }
                            }
                            
                            Group {
                                HStack(alignment: .top){
                                    Text("추천 스포츠시설")
                                        .font(.system(size:20))
                                        .fontWeight(.black)
                                        .frame(height: 20, alignment: .leading)
                                        .padding(.leading, 10)
                                    Spacer()
                                }.padding(.top, 20)
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        HomeTextView(title: "전체", category: "추천스포츠시설")
                                        
                                        ForEach(self.infraCViewModel.infraCSportModel, id: \.self) { infraMenu in
                                            HomeTextView(title: "\(infraMenu.name!)", category: "추천스포츠시설")
                                        }
                                    }
                                }
                                .frame(height: 10)
                                .padding(7)
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(self.infraViewModel.infraSportRModel, id: \.self) { infraSportModel in
                                            
                                            NavigationLink(destination: TeamDetailFacilityView(infraModel: infraSportModel), isActive: $isSportShowing) {
                                                Button(action: {
                                                    self.isSportShowing = true
                                                    self.infraViewModel.set_infra(infraObject: infraSportModel)
                                                }) {
                                                    if infraSportModel.attachFiles!.count > 0 {
                                                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraSportModel.attachFiles![0].saveFilePath!, title: infraSportModel.name!, width:100, height:100)
                                                    }
                                                }
                                            }
                                            .navigationBarTitle("홈", displayMode: .inline)
                                        }
                                    }
                                }
                                .frame(height: 100)
                                .padding(10).padding(.bottom,30)
                            }
                            
                            Group {
                                HStack(){
                                    Text("추천 숙소")
                                        .font(.system(size:20))
                                        .fontWeight(.black)
                                        .frame(height: 20, alignment: .leading)
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        HomeTextView(title: "전체", category: "추천숙소")
                                        
                                        ForEach(self.infraCViewModel.infraCHotelModel, id: \.self) { infraMenu in
                                            HomeTextView(title: "\(infraMenu.name!)", category: "추천숙소")
                                        }
                                    }
                                }
                                .frame(height: 10)
                                .padding(7)
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(self.infraViewModel.infraHotelRModel, id: \.self) { infraHotelModel in
                                            
                                            NavigationLink(destination: TeamDetailFacilityView(infraModel: infraHotelModel), isActive: $isHotelShowing) {
                                                Button(action: {
                                                    self.infraViewModel.set_infra(infraObject: infraHotelModel)
                                                    self.isHotelShowing = true
                                                }) {
                                                    
                                                    if infraHotelModel.attachFiles!.count > 0 {
                                                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraHotelModel.attachFiles![0].saveFilePath!, title: infraHotelModel.name!, width:100, height:100)
                                                    }
                                                    
                                                }
                                            }
                                            //                                .navigationBarTitle("HomeView")
                                        }
                                    }
                                }
                                .frame(height: 100)
                                .padding(10).padding(.bottom,30)
                            }
                            Group {
                                HStack(){
                                    Text("추천 맛집")
                                        .font(.system(size:20))
                                        .fontWeight(.black)
                                        .frame(height: 20, alignment: .leading)
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        HomeTextView(title: "전체", category: "추천맛집")
                                        
                                        ForEach(self.infraCViewModel.infraCFoodModel, id: \.self) { infraMenu in
                                            HomeTextView(title: "\(infraMenu.name!)", category: "추천맛집")
                                        }
                                    }
                                }
                                .frame(height: 10)
                                .padding(7)
                                
                                
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(self.infraViewModel.infraFoodRModel, id: \.self) { infraFoodModel in
                                            
                                            NavigationLink(destination: TeamDetailFacilityView(infraModel: infraFoodModel), isActive: $isFoodShowing) {
                                                Button(action: {
                                                    self.isFoodShowing = true
                                                    self.infraViewModel.set_infra(infraObject: infraFoodModel)
                                                }) {
                                                    if infraFoodModel.attachFiles!.count > 0 {
                                                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraFoodModel.attachFiles![0].saveFilePath!, title: infraFoodModel.name!, width:100, height:100)
                                                    }
                                                }
                                            }
                                            //                                .navigationBarTitle("HomeView")
                                        }
                                    }
                                }
                                .frame(height: 100)
                                .padding(10).padding(.bottom,20)
                            }
                        }
                    }
                    
                    
                    if self.isLoading {
                        GeometryReader {_ in
                            
                            Loader().padding(.top, -100)
                            
                        }
                        .background(Color.black.opacity(0.4))
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                    }
                }.onReceive(timer) { input in
                    self.isLoading = false
                }            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


//   InfraCategory Sample Source
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(self.infraCViewModel.infraCategoryModel, id: \.self) { infraCModel in
//                                NavigationLink(destination: Text(verbatim: "dd")) {
//
//                                    Text("\(infraCModel.infraCategoryNo ?? 0)")
//                                }
//                                .navigationBarTitle("HomeView")
//                            }
//                        }
//                    }
//                    .frame(height: 100)
//
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
//                                NavigationLink(destination: Text(verbatim: "dd")) {
//                                    ForEach(infraFoodModel.childInfras!, id: \.self) {
//                                        infraModel in
//                                        Text("\(infraModel.name ?? "")")
//                                    }
//                                }
//                                .navigationBarTitle("HomeView")
//                            }
//                        }
//                    }
//                    .frame(height: 100)


//                            ForEach(self.vm.virtualData) { virtual in
//                                NavigationLink(destination: Text("dd")) {
//                                    ImageCell(imageUrl: virtual.thumbnailUrl, title: "virtual.title")
//                                }
//                                .navigationBarTitle("HomeView")
//                            }

//                                                ForEach(infraHotelModel.attachFiles!, id: \.self) {
//                                                    infraModel in
//                                                    ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: infraHotelModel.name!)
//                                                }
