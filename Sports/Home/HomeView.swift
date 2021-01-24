//
//  Home.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var vm = VirtualViewModel()
    @ObservedObject private var infraCViewModel = InfraCategoryViewModel()
    @ObservedObject private var infraViewModel = InfraViewModel()
    
    var body: some View {
        NavigationView {
            
            ScrollView() {
                VStack {
                    
                    HomeImageView(image: "image", width: 100, height: 100)
                    
                    ScrollView(.horizontal) {
                        HStack(){
                            HomeIntroView(title: "전지훈련팀 스포츠 투어링이 처음이신가요?", subTitle: "서비스소개 >")
                            HomeIntroView(title: "모바일로 운동기록하고 위치기반 투어링을 추천 받아보세요.", subTitle: "모바일이용가이드 >")
                            HomeIntroView(title: "운영센터", subTitle: "운영센터소개 >")
                            
                        }.padding(10)
                        .cornerRadius(10)
                    }
                    
//                    Text("Some horizontalView1")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
//                            HomeTextView(title: "전체")
                                              
                            Button(action:{
                                self.infraViewModel.isDisplay(title: "전체")
                            }){
                                Text("전체")
                                    .frame(width: CGFloat("전체".count) * 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(5)
                                    .foregroundColor(Color.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                            }
              
                            ForEach(self.infraViewModel.infraSportModel, id: \.self) { infraSportModel in
                                if infraSportModel.sportCode != nil {
                                  HomeTextView(title: "\(infraSportModel.sportCode!.name!)")
                                }
                            }
                        }
                    }
                    .frame(height: 100)
                    .padding(5)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.infraViewModel.infraSportModel, id: \.self) { infraSportModel in
                                
                                NavigationLink(destination: Text(verbatim: "dd")) {
                                    ForEach(infraSportModel.attachFiles!, id: \.self) {
                                        infraModel in
                                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
                                    }
                                }
                                .navigationBarTitle("HomeView")
                                
                                
                            }
                        }
                    }
                    .frame(height: 100)
                    .padding(5)
                    
                    Text("Some horizontalView2")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.vm.virtualData, id: \.self) { virtual in
                                NavigationLink(destination: Text("dd")) {
                                    ImageCell(imageUrl: virtual.thumbnailUrl, title: "virtual.title")
                                }
                                .navigationBarTitle("HomeView")
                            }
                        }
                    }
                    .frame(height: 100)
                    
                    
                    Text("Some horizontalView2")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.infraCViewModel.infraCategoryModel, id: \.self) { infraCModel in
                                NavigationLink(destination: Text(verbatim: "dd")) {
                                    
                                    Text("\(infraCModel.infraCategoryNo ?? 0)")
                                }
                                .navigationBarTitle("HomeView")
                            }
                        }
                    }
                    .frame(height: 100)
                    
                    
                    Text("Some horizontalView4")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
                                NavigationLink(destination: Text(verbatim: "dd")) {
                                    ForEach(infraFoodModel.childInfras!, id: \.self) {
                                        infraModel in
                                        Text("\(infraModel.name ?? "")")
                                    }
                                }
                                .navigationBarTitle("HomeView")
                            }
                        }
                    }
                    .frame(height: 100)
                    
                    
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



//                            ForEach(self.vm.virtualData) { virtual in
//                                NavigationLink(destination: Text("dd")) {
//                                    ImageCell(imageUrl: virtual.thumbnailUrl, title: "virtual.title")
//                                }
//                                .navigationBarTitle("HomeView")
//                            }
