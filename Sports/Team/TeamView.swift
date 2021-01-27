//
//  Home.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

struct TeamView: View {
    
    @ObservedObject private var infraViewModel = InfraViewModel()
    @State var isModal: Bool = false
    
    var body: some View {
        NavigationView {
            
            ScrollView() {
                VStack {
                    
                    HomeImageView(image: "image", width: 100, height: 100)
                    
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
                        .navigationBarTitle("Navigation", displayMode: .inline)
                        
                    }
                    .padding(10)
                    //                    .background(Color.white)
                    //                    .cornerRadius(20)
                    //                    .overlay(Rectangle()
                    //                                .stroke(lineWidth: 0.5))
                    
                    Group {
                        
                        HStack(){
                            Text("추천 스포츠시설")
                                .font(.system(size:20))
                                .fontWeight(.black)
                                .frame(height: 20, alignment: .leading)
                        }
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                //                            HomeTextView(title: "전체")
                                
                                Button(action:{
                                    self.infraViewModel.isDisplay(title: "전체")
                                }){
                                    Text("전체")
                                        .frame(width: CGFloat("전체".count) * 20, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                        .frame(height: 30)
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
                                    .navigationBarTitle("Navigation", displayMode: .inline)
                                    
                                    
                                }
                            }
                        }
                        .frame(height: 100)
                        .padding(5).padding(.bottom,30)
                        
                        HStack(){
                            Text("부대 시설")
                                .font(.system(size:20))
                                .fontWeight(.black)
                                .frame(height: 20, alignment: .leading)
                        }
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                //                            HomeTextView(title: "전체")
                                
                                Button(action:{
                                    self.infraViewModel.isDisplay(title: "전체")
                                }){
                                    Text("전체")
                                        .frame(width: CGFloat("전체".count) * 20, height: 15, alignment: .center)
                                        .padding(5)
                                        .foregroundColor(Color.white)
                                        .background(Color.black)
                                        .cornerRadius(15)
                                }
                                
                                ForEach(self.infraViewModel.infraFacilityModel, id: \.self) { infraFacilityModel in
                                    if infraFacilityModel.name != nil {
                                        HomeTextView(title: "\(infraFacilityModel.name!)")
                                    }
                                }
                            }
                        }
                        .frame(height: 30)
                        .padding(5)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.infraViewModel.infraFacilityModel, id: \.self) { infraFacilityModel in
                                    
                                    NavigationLink(destination: Text(verbatim: "dd")) {
                                        ForEach(infraFacilityModel.attachFiles!, id: \.self) {
                                            infraModel in
                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
                                        }
                                    }
                                    //                                .navigationBarTitle("HomeView")
                                    
                                    
                                }
                            }
                        }
                        .frame(height: 100)
                        .padding(5).padding(.bottom,30)
                        
                        HStack(){
                            Text("전지훈련팀 스토리")
                                .font(.system(size:20))
                                .fontWeight(.black)
                                .frame(height: 20, alignment: .leading)
                        }
                
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in

                                    NavigationLink(destination: Text(verbatim: "dd")) {
                                        ForEach(infraFoodModel.attachFiles!, id: \.self) {
                                            infraModel in
                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
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

struct Team_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}


