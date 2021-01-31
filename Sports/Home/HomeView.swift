//
//  Home.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var infraViewModel:InfraViewModel
    
    @State private var isTrackerShowing = false
    @State private var isSportShowing = false
    @State private var isHotelShowing = false
    @State private var isFoodShowing = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                
                ScrollView() {
                    VStack {
                        Group {
                            ZStack (alignment:.top) {
                                
                                HomeImageView(image: "m-intro_bg", width: geo.size.width, height: 200)
                                //                                    .padding(.top,10)
                                HomeImageView(image: "logo-intro", width: geo.size.width / 2 , height: 100)
                                    .padding(.top,50)
                                NavigationLink(destination: TrackingConfigView(), isActive: $isTrackerShowing) {
                                    
                                }.navigationBarTitle("스포츠 투어링", displayMode: .inline)
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
                                    //                                                        .padding(.trailing, 20).padding(.top,20)
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
                            }
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    HomeTextView(title: "전체", category: "스포츠시설")
                                    
                                    ForEach(self.infraViewModel.infraSportMenu, id: \.self) { infraSportMenu in
//                                        if infraSportModel.sportCode != nil {
//                                            self.infraViewModel.checkMenuSport(sportCode: infraSportModel.sprotCode)
                                        HomeTextView(title: "\(infraSportMenu)", category: "스포츠시설")
//                                        }
                                    }
                                }
                            }
                            .frame(height: 30)
                            .padding(10)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(self.infraViewModel.infraSportModel, id: \.self) { infraSportModel in
                                        
                                        NavigationLink(destination: TeamDetailSportView(infraModel: infraSportModel), isActive: $isSportShowing) {
                                            Button(action: {
                                                self.isSportShowing = true
                                            }) {
                                                ForEach(infraSportModel.attachFiles!, id: \.self) {
                                                    infraModel in
                                                    ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: infraSportModel.name!)
                                                }
                                            }
                                        }
                                        .navigationBarTitle("Sport", displayMode: .inline)
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
                                    HomeTextView(title: "전체", category: "숙소")
                                    
                                    ForEach(self.infraViewModel.infraHotelModel, id: \.self) { infraHotelModel in
                                        if infraHotelModel.name != nil {
                                            HomeTextView(title: "\(infraHotelModel.name!)", category: "숙소")
                                        }
                                    }
                                }
                            }
                            .frame(height: 30)
                            .padding(10)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(self.infraViewModel.infraHotelModel, id: \.self) { infraHotelModel in
                                        
                                        NavigationLink(destination: TeamDetailSportView(infraModel: infraHotelModel), isActive: $isHotelShowing) {
                                            Button(action: {
                                                self.infraViewModel.set_infra(infraObject: infraHotelModel)
                                                self.isHotelShowing = true
                                                
                                            }) {
                                                ForEach(infraHotelModel.attachFiles!, id: \.self) {
                                                    infraModel in
                                                    ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: infraHotelModel.name!)
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
                                    HomeTextView(title: "전체", category: "맛집")
                                    
                                    ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
                                        if infraFoodModel.name != nil {
                                            HomeTextView(title: "\(infraFoodModel.name!)", category: "맛집")
                                        }
                                    }
                                }
                            }
                            .frame(height: 30)
                            .padding(10)
                            
                            
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
                                        
                                        NavigationLink(destination: TeamDetailSportView(infraModel: infraFoodModel), isActive: $isFoodShowing) {
                                            Button(action: {
                                                self.isFoodShowing = true
                                            }) {
                                                ForEach(infraFoodModel.attachFiles!, id: \.self) {
                                                    infraModel in
                                                    ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: infraFoodModel.name!)
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
            }
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
