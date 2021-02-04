//
//  TouringView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/27.
//

import SwiftUI

struct TouringView: View {
    
    @EnvironmentObject var infraViewModel:InfraViewModel
    @EnvironmentObject var infraCViewModel:InfraCategoryViewModel
    
    @State private var isSportShowing = false
    @State private var isHotelShowing = false
    @State private var isFoodShowing = false
    @State private var isFestivalShowing = false
    @State private var isTrafficShowing = false
    @State private var isTravelShowing = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView() {
                    VStack {
                        Group {
                            HomeImageView(image: "touring_main_visual02", width: geo.size.width, height: 200)
                            
                            HStack(){
                                
                                //                            NavigationLink(destination: SearchBarView()) {
                                NavigationLink(destination: Text(verbatim: "구현 중")) {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 4)
                                    
                                    Text("어디로 방문하세요?")
                                        //                                .padding(.left, -20)
                                        .foregroundColor(.secondary)
                                    
                                }.padding(.bottom,10).padding(.top,10).padding(.leading,60).padding(.trailing,50)
                                .overlay(Rectangle().stroke(lineWidth: 0.5))
                                .navigationBarTitle("투어링", displayMode: .inline)
                                
                            }
                            .padding(10)
                            
                            HStack(){
                                Text("경남도 투어링 가이드")
                                    .font(.system(size:20))
                                    .fontWeight(.black)
                                    .frame(height: 20, alignment: .leading)
                                    .padding(.leading, 10)
                                Spacer()
                            }
                            
                            HStack() {
                                TouringImageView(image: "touring_main_bn01", width: geo.size.width * 0.45, height: 100)
                                //                                .padding(.leading, 20)
                                TouringImageView(image: "touring_main_bn02", width: geo.size.width * 0.45, height: 100)
                                //                                .padding(.trailing, 20)
                                
                            }
                            //                        .padding(.leading, 10).padding(.trailing, 10)
                            .padding(.bottom,30)
                            
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
                            .padding(10).padding(.bottom,20)
                        }
                        
                        Group {
                            HStack(alignment: .top){
                                Text("추천 축제")
                                    .font(.system(size:20))
                                    .fontWeight(.black)
                                    .frame(height: 20, alignment: .leading)
                                    .padding(.leading, 10)
                                Spacer()
                            }.padding(.top, 20)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    HomeTextView(title: "전체", category: "추천축제")
                                    
                                    ForEach(self.infraCViewModel.infraCFestivalModel, id: \.self) { infraMenu in
                                        HomeTextView(title: "\(infraMenu.name!)", category: "추천축제")
                                    }
                                }
                            }
                            .frame(height: 10)
                            .padding(7)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(self.infraViewModel.infraFestivalRModel, id: \.self) { infraFestivalModel in
                                        
                                        NavigationLink(destination: TeamDetailFacilityView(infraModel: infraFestivalModel), isActive: $isFestivalShowing) {
                                            Button(action: {
                                                self.isFestivalShowing = true
                                                self.infraViewModel.set_infra(infraObject: infraFestivalModel)
                                            }) {
                                                if infraFestivalModel.attachFiles!.count > 0 {
                                                    ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraFestivalModel.attachFiles![0].saveFilePath!, title: infraFestivalModel.name!, width:100, height:100)
                                                }
                                            }
                                        }
                                        .navigationBarTitle("홈", displayMode: .inline)
                                    }
                                }
                            }
                            .frame(height: 100)
                            .padding(10).padding(.bottom,20)
                        }
                        
                        Group {
                            HStack(alignment: .top){
                                Text("추천 관광")
                                    .font(.system(size:20))
                                    .fontWeight(.black)
                                    .frame(height: 20, alignment: .leading)
                                    .padding(.leading, 10)
                                Spacer()
                            }.padding(.top, 20)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    HomeTextView(title: "전체", category: "추천관광")
                                    
                                    ForEach(self.infraCViewModel.infraCTravelModel, id: \.self) { infraMenu in
                                        HomeTextView(title: "\(infraMenu.name!)", category: "추천관광")
                                    }
                                }
                            }
                            .frame(height: 10)
                            .padding(7)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(self.infraViewModel.infraTravelRModel, id: \.self) { infraTravelModel in
                                        
                                        NavigationLink(destination: TeamDetailFacilityView(infraModel: infraTravelModel), isActive: $isTravelShowing) {
                                            Button(action: {
                                                self.isTravelShowing = true
                                                self.infraViewModel.set_infra(infraObject: infraTravelModel)
                                            }) {
                                                if infraTravelModel.attachFiles!.count > 0 {
                                                    ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraTravelModel.attachFiles![0].saveFilePath!, title: infraTravelModel.name!, width:100, height:100)
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
            }
        }
    }
    
}
