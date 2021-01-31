//
//  TouringView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/27.
//

import SwiftUI

struct TouringView: View {
    
    @ObservedObject private var infraViewModel = InfraViewModel()
    @State var isModal: Bool = false
    
    var body: some View {
        NavigationView {
            
//            ScrollView() {
//                VStack {
//                    Group {
//                        HomeImageView(image: "image", width: 100, height: 100)
//
//                        HStack(){
//
//                            NavigationLink(destination: SearchBarView()) {
//                                Image(systemName: "magnifyingglass")
//                                    .foregroundColor(.gray)
//                                    //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//                                    .padding(.leading, 4)
//
//                                Text("시설이나 팀을 검색해 보세요")
//                                    //                                .padding(.left, -20)
//                                    .foregroundColor(.secondary)
//
//                            }.padding(.bottom,10).padding(.top,10).padding(.leading,60).padding(.trailing,50)
//                            .overlay(Rectangle().stroke(lineWidth: 0.5))
//                            .navigationBarTitle("Navigation", displayMode: .inline)
//
//                        }
//                        .padding(10)
//                        //                    .background(Color.white)
//                        //                    .cornerRadius(20)
//                        //                    .overlay(Rectangle()
//                        //                                .stroke(lineWidth: 0.5))
//
//                        HStack(){
//                            Text("경남도 투어링 가이드")
//                                .font(.system(size:20))
//                                .fontWeight(.black)
//                                .frame(height: 20, alignment: .leading)
//                                .padding(.leading, 10)
//                            Spacer()
//                        }
//
//                        HStack() {
//                            TouringImageView(image: "image", width: 100, height: 100)
//                            TouringImageView(image: "image", width: 100, height: 100)
//
//                        }.padding(5).padding(.bottom,30)
//
//                    }
//
//                    Group {
//
//                        HStack(){
//                            Text("스포츠시설 주변 추천 투어")
//                                .font(.system(size:20))
//                                .fontWeight(.black)
//                                .frame(height: 20, alignment: .leading)
//                                .padding(.leading, 10)
//                            Spacer()
//                        }
//
//                        ScrollView (.horizontal, showsIndicators: false) {
//                            HStack {
//                                ForEach(self.infraViewModel.infraSportModel, id: \.self) { infraSportModel in
//
//                                    NavigationLink(destination: Text(verbatim: "dd")) {
//                                        ForEach(infraSportModel.attachFiles!, id: \.self) {
//                                            infraModel in
//                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
//                                        }
//                                    }
//                                    .navigationBarTitle("Navigation", displayMode: .inline)
//                                }
//                            }
//                        }
//                        .frame(height: 100)
//                        .padding(5).padding(.bottom,30)
//                    }
//
//                    Group {
//                        HStack(){
//                            Text("추천 스포츠시설")
//                                .font(.system(size:20))
//                                .fontWeight(.black)
//                                .frame(height: 20, alignment: .leading)
//                                .padding(.leading, 10)
//                            Spacer()
//                        }
//
//                        ScrollView (.horizontal, showsIndicators: false) {
//                            HStack {
//                                HomeTextView(title: "전체", menuWord: infraViewModel.sportMenu)
//
//                                ForEach(self.infraViewModel.infraSportModel, id: \.self) { infraSportModel in
//                                    if infraSportModel.sportCode != nil {
//                                        HomeTextView(title: "\(infraSportModel.sportCode!.name!)", menuWord: infraViewModel.sportMenu)
//                                    }
//                                }
//                            }
//                        }
//                        .frame(height: 30)
//                        .padding(5)
//
//                        ScrollView (.horizontal, showsIndicators: false) {
//                            HStack {
//                                ForEach(self.infraViewModel.infraSportModel, id: \.self) { infraSportModel in
//
//                                    NavigationLink(destination: Text(verbatim: "dd")) {
//                                        ForEach(infraSportModel.attachFiles!, id: \.self) {
//                                            infraModel in
//                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
//                                        }
//                                    }
//                                    .navigationBarTitle("Navigation", displayMode: .inline)
//
//
//                                }
//                            }
//                        }
//                        .frame(height: 100)
//                        .padding(5).padding(.bottom,30)
//                }
//
//                Group{
//
//                    HStack(){
//                        Text("추천 축제")
//                            .font(.system(size:20))
//                            .fontWeight(.black)
//                            .frame(height: 20, alignment: .leading)
//                            .padding(.leading, 10)
//                        Spacer()
//                    }
//
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            HomeTextView(title: "전체", menuWord: infraViewModel.sportMenu)
//
//                            ForEach(self.infraViewModel.infraFestivalModel, id: \.self) { infraFestivalModel in
//                                if infraFestivalModel.name != nil {
//                                    HomeTextView(title: "\(infraFestivalModel.name!)", menuWord: infraViewModel.sportMenu)
//                                }
//                            }
//                        }
//                    }
//                    .frame(height: 30)
//                    .padding(5)
//
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(self.infraViewModel.infraFestivalModel, id: \.self) { infraFestivalModel in
//
//                                NavigationLink(destination: Text(verbatim: "dd")) {
//                                    ForEach(infraFestivalModel.attachFiles!, id: \.self) {
//                                        infraModel in
//                                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
//                                    }
//                                }
//                                //                                .navigationBarTitle("HomeView")
//
//
//                            }
//                        }
//                    }
//                    .frame(height: 100)
//                    .padding(5).padding(.bottom,30)
//
//                }
//
//                Group{
//
//                    HStack(){
//                        Text("추천 숙소")
//                            .font(.system(size:20))
//                            .fontWeight(.black)
//                            .frame(height: 20, alignment: .leading)
//                            .padding(.leading, 10)
//                        Spacer()
//                    }
//
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            HomeTextView(title: "전체",menuWord: infraViewModel.sportMenu)
//
//                            ForEach(self.infraViewModel.infraHotelModel, id: \.self) { infraHotelModel in
//                                if infraHotelModel.name != nil {
//                                    HomeTextView(title: "\(infraHotelModel.name!)")
//                                }
//                            }
//                        }
//                    }
//                    .frame(height: 30)
//                    .padding(5)
//
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(self.infraViewModel.infraHotelModel, id: \.self) { infraHotelModel in
//
//                                NavigationLink(destination: Text(verbatim: "dd")) {
//                                    ForEach(infraHotelModel.attachFiles!, id: \.self) {
//                                        infraModel in
//                                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
//                                    }
//                                }
//                                //                                .navigationBarTitle("HomeView")
//
//
//                            }
//                        }
//                    }
//                    .frame(height: 100)
//                    .padding(5).padding(.bottom,30)
//
//                }
//
//                Group {
//
//                    HStack(){
//                        Text("추천 맛집")
//                            .font(.system(size:20))
//                            .fontWeight(.black)
//                            .frame(height: 20, alignment: .leading)
//                            .padding(.leading, 10)
//                        Spacer()
//                    }
//
//
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            HomeTextView(title: "전체",menuWord: infraViewModel.sportMenu)
//
//                            ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
//                                if infraFoodModel.name != nil {
//                                    HomeTextView(title: "\(infraFoodModel.name!)",menuWord: infraViewModel.sportMenu)
//                                }
//                            }
//                        }
//                    }
//                    .frame(height: 30)
//                    .padding(5)
//
//
//
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
//
//                                NavigationLink(destination: Text(verbatim: "dd")) {
//                                    ForEach(infraFoodModel.attachFiles!, id: \.self) {
//                                        infraModel in
//                                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
//                                    }
//                                }
//                                //                                .navigationBarTitle("HomeView")
//
//
//                            }
//                        }
//                    }
//                    .frame(height: 100)
//                    .padding(5).padding(.bottom,20)
//
//                }
//
//
//                Group {
//
//                    HStack(){
//                        Text("부대 시설")
//                            .font(.system(size:20))
//                            .fontWeight(.black)
//                            .frame(height: 20, alignment: .leading)
//                            .padding(.leading, 10)
//                        Spacer()
//                    }
//
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            HomeTextView(title: "전체",menuWord: infraViewModel.sportMenu)
//
//                            ForEach(self.infraViewModel.infraFacilityModel, id: \.self) { infraFacilityModel in
//                                if infraFacilityModel.name != nil {
//                                    HomeTextView(title: "\(infraFacilityModel.name!)",menuWord: infraViewModel.sportMenu)
//                                }
//                            }
//                        }
//                    }
//                    .frame(height: 30)
//                    .padding(5)
//
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(self.infraViewModel.infraFacilityModel, id: \.self) { infraFacilityModel in
//
//                                NavigationLink(destination: Text(verbatim: "dd")) {
//                                    ForEach(infraFacilityModel.attachFiles!, id: \.self) {
//                                        infraModel in
//                                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
//                                    }
//                                }
//                                //                                .navigationBarTitle("HomeView")
//
//
//                            }
//                        }
//                    }
//                    .frame(height: 100)
//                    .padding(5).padding(.bottom,30)
//                }
//
//                    Group{
//                    HStack(){
//                        Text("전지훈련팀 스토리")
//                            .font(.system(size:20))
//                            .fontWeight(.black)
//                            .frame(height: 20, alignment: .leading)
//                            .padding(.leading, 10)
//                        Spacer()
//                    }
//
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
//
//                                NavigationLink(destination: Text(verbatim: "dd")) {
//                                    ForEach(infraFoodModel.attachFiles!, id: \.self) {
//                                        infraModel in
//                                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
//                                    }
//                                }
//                                //                                .navigationBarTitle("HomeView")
//
//
//                            }
//                        }
//                    }
//                    .frame(height: 100)
//                    .padding(5).padding(.bottom,20)
//
//                }
//            }}
    }
}

}
