//
//  Home.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

struct HomeView: View {
    //    @ObservedObject private var infraCViewModel = InfraCategoryViewModel()
    @ObservedObject private var infraViewModel = InfraViewModel()
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
                                NavigationLink(destination: Tracker(), isActive: $isTrackerShowing) {
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
                                    .padding(.trailing, 20).padding(.top,20)
                                    .transition(.move(edge: .trailing))
                                    .animation(.default)
                                }.navigationBarTitle("Tracker", displayMode: .inline)
                                HomeImageView(image: "image", width: 200, height: 200)
                                    .padding(.top,10)
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
                                    HomeTextView(title: "전체")
                                    
                                    ForEach(self.infraViewModel.infraSportModel, id: \.self) { infraSportModel in
                                        if infraSportModel.sportCode != nil {
                                            HomeTextView(title: "\(infraSportModel.sportCode!.name!)")
                                        }
                                    }
                                }
                            }
                            .frame(height: 30)
                            .padding(5)
                            
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
                            .padding(5).padding(.bottom,30)
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
                                    HomeTextView(title: "전체")
                                    
                                    ForEach(self.infraViewModel.infraHotelModel, id: \.self) { infraHotelModel in
                                        if infraHotelModel.name != nil {
                                            HomeTextView(title: "\(infraHotelModel.name!)")
                                        }
                                    }
                                }
                            }
                            .frame(height: 30)
                            .padding(5)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(self.infraViewModel.infraHotelModel, id: \.self) { infraHotelModel in
                                        
                                        NavigationLink(destination: TeamDetailSportView(infraModel: infraHotelModel), isActive: $isHotelShowing) {
                                            Button(action: {
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
                            .padding(5).padding(.bottom,30)
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
                                    HomeTextView(title: "전체")
                                    
                                    ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
                                        if infraFoodModel.name != nil {
                                            HomeTextView(title: "\(infraFoodModel.name!)")
                                        }
                                    }
                                }
                            }
                            .frame(height: 30)
                            .padding(5)
                            
                            
                            
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
                            .padding(5).padding(.bottom,20)
                            
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
