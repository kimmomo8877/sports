//
//  Home.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

struct TeamView: View {
    
    @EnvironmentObject var infraViewModel: InfraViewModel
    @EnvironmentObject var infraCViewModel:InfraCategoryViewModel
    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel.shared
    @State var isModal: Bool = false
    @State var isSportShowing = false
    @State var isFacilityShowing = false
    @State var isShowing = false
    @State var searchText:String = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView() {
                    VStack {
                        
                        if self.loginViewModel.isLogined {
                            Group {
                                HomeImageView(image: "team_main", width: geo.size.width, height: 200)
                                
                                    NavigationLink(destination: SearchBarView(), isActive: $isShowing) {
                                        
                                           
                                            HStack() {

//                                                ForEach(self.infraViewModel.reservationModel[0], id: \.self) { model in
                                    
                                               
                                                if (infraViewModel.reservationModel[0].attachFiles != nil ) {
                                                    ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraViewModel.reservationModel[0].attachFiles![0].saveFilePath!, title: "", width: 50, height: 50)
                                                } else {
                                                    HomeImageView(image: "search_default_image", width: 50, height: 50)
                                                }
//                                                HomeImageView(image: "search_default_image", width: 50, height: 50)
                                                VStack() {
                                                    Text(infraViewModel.reservationModel[0].infra!.name!)
                                                    Text(infraViewModel.reservationModel[0].startDate!)
                                                    Text(infraViewModel.reservationModel[0].endDate!)
                                                }
                                                HomeImageView(image: "search_default_image", width: 30, height: 30)
                                                Spacer()
                                                }
                                            
//                                        }
                                    }
                                    .navigationBarTitle("주변시설", displayMode: .inline)
                                    
                                //                    .background(Color.white)
                                //                    .cornerRadius(20)
                                //                    .overlay(Rectangle()
                                //                                .stroke(lineWidth: 0.5))
                            }
                            
                            Group {
                                
                                HStack(){
                                    Text("주변 부대시설")
                                        .font(.system(size:20))
                                        .fontWeight(.black)
                                        .frame(height: 20, alignment: .leading)
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        HomeTextView(title: "전체", category: "부대시설")
                                        
                                        ForEach(self.infraCViewModel.infraCFacilityModel, id: \.self) { infraMenu in
                                            HomeTextView(title: "\(infraMenu.name!)", category: "부대시설")
                                        }
                                    }
                                }
                                .frame(height: 10)
                                .padding(7)
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(self.infraViewModel.infraFacilityDModel, id: \.self) { infraSportModel in
                                            
                                            NavigationLink(destination: FacilityDetailView(infraModel: infraSportModel), isActive: $isSportShowing) {
                                                Button(action: {
                                                    self.isSportShowing = true
                                                    self.infraViewModel.setInfra(infraObject: infraSportModel)
                                                }) {
                                                    VStack(spacing: 0) {
                                                        if infraSportModel.attachFiles!.count > 0 {
                                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraSportModel.attachFiles![0].saveFilePath!, title: infraSportModel.name!, width: 100, height: 100)
                                                        } else {
                                                            HomeImageView(image: "search_default_image", width: 100, height: 100)
                                                        }
                                                        Text(infraSportModel.name!)
                                                            .frame(width: 100, height: 15)
                                                            .font(.system(size:12))
                                                            .foregroundColor(.white)
                                                            .background(Color.black)
                                                            .opacity(0.8)
                                                    }
                                                }
                                            }
                                            .navigationBarTitle("전지훈련팀", displayMode: .inline)
                                            
                                            
                                        }
                                    }
                                }
                                .frame(height: 100)
                                .padding(5).padding(.bottom,30)
                                
                                
                                HStack(){
                                    Text("주변 숙소")
                                        .font(.system(size:20))
                                        .fontWeight(.black)
                                        .frame(height: 20, alignment: .leading)
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        HomeTextView(title: "전체", category: "숙소")
                                        
                                        ForEach(self.infraCViewModel.infraCHotelModel, id: \.self) { infraMenu in
                                            HomeTextView(title: "\(infraMenu.name!)", category: "숙소")
                                        }
                                    }
                                }
                                .frame(height: 10)
                                .padding(7)
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(self.infraViewModel.infraHotelDModel, id: \.self) { infraSportModel in
                                            
                                            NavigationLink(destination: FacilityDetailView(infraModel: infraSportModel), isActive: $isSportShowing) {
                                                Button(action: {
                                                    self.isSportShowing = true
                                                    self.infraViewModel.setInfra(infraObject: infraSportModel)
                                                }) {
                                                    VStack(spacing: 0) {
                                                        if infraSportModel.attachFiles!.count > 0 {
                                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraSportModel.attachFiles![0].saveFilePath!, title: infraSportModel.name!, width: 100, height: 100)
                                                        } else {
                                                            HomeImageView(image: "search_default_image", width: 100, height: 100)
                                                        }
                                                        Text(infraSportModel.name!)
                                                            .frame(width: 100, height: 15)
                                                            .font(.system(size:12))
                                                            .foregroundColor(.white)
                                                            .background(Color.black)
                                                            .opacity(0.8)
                                                    }
                                                }
                                            }
                                            .navigationBarTitle("전지훈련팀", displayMode: .inline)
                                            
                                            
                                        }
                                    }
                                }
                                .frame(height: 100)
                                .padding(5).padding(.bottom,30)
                                
                                
                                
                                HStack(){
                                    Text("주변 숙소")
                                        .font(.system(size:20))
                                        .fontWeight(.black)
                                        .frame(height: 20, alignment: .leading)
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        HomeTextView(title: "전체", category: "맛집")
                                        
                                        ForEach(self.infraCViewModel.infraCFoodModel, id: \.self) { infraMenu in
                                            HomeTextView(title: "\(infraMenu.name!)", category: "맛집")
                                        }
                                    }
                                }
                                .frame(height: 10)
                                .padding(7)
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(self.infraViewModel.infraFoodDModel, id: \.self) { infraFacilityModel in
                                            
                                            NavigationLink(destination: FacilityDetailView(infraModel: infraFacilityModel), isActive: $isFacilityShowing) {
                                                Button(action: {
                                                    self.isFacilityShowing = true
                                                    self.infraViewModel.setInfra(infraObject: infraFacilityModel)
                                                }) {
                                                    VStack(spacing:0) {
                                                        if infraFacilityModel.attachFiles!.count > 0 {
                                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraFacilityModel.attachFiles![0].saveFilePath!, title: infraFacilityModel.name!, width: 100, height:100)
                                                        } else {
                                                            HomeImageView(image: "search_default_image", width: 100, height: 100)
                                                        }
                                                        Text(infraFacilityModel.name!)
                                                            .frame(width: 100, height: 15)
                                                            .font(.system(size:12))
                                                            .foregroundColor(.white)
                                                            .background(Color.black)
                                                            .opacity(0.8)
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
                        } else {
                            
                            Group {
                                HomeImageView(image: "team_main", width: geo.size.width, height: 200)
                                
                                HStack(){
                                    
                                    
                                    NavigationLink(destination: SearchBarView(), isActive: $isShowing) {
                                        Button(action: {
                                            //                                    TextField("Search ...", text: $searchText)
                                            self.isShowing = true
                                        }) {
                                            Image(systemName: "magnifyingglass")
                                                .foregroundColor(.gray)
                                                //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading, 4)
                                            
                                            Text("시설이나 팀을 검색해 보세요")
                                                //                                .padding(.left, -20)
                                                .foregroundColor(.secondary)
                                            
                                        }
                                        .padding(.bottom,10).padding(.top,10).padding(.leading,60).padding(.trailing,50)
                                        .overlay(Rectangle().stroke(lineWidth: 0.5))
                                        
                                    }
                                    .navigationBarTitle("전지훈련팀", displayMode: .inline)
                                    
                                }
                                .padding(10)
                                //                    .background(Color.white)
                                //                    .cornerRadius(20)
                                //                    .overlay(Rectangle()
                                //                                .stroke(lineWidth: 0.5))
                            }
                            
                            Group {
                                
                                HStack(){
                                    Text("스포츠시설")
                                        .font(.system(size:20))
                                        .fontWeight(.black)
                                        .frame(height: 20, alignment: .leading)
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        HomeTextView(title: "전체", category: "스포츠시설")
                                        
                                        ForEach(self.infraCViewModel.infraCSportModel, id: \.self) { infraMenu in
                                            HomeTextView(title: "\(infraMenu.name!)", category: "스포츠시설")
                                        }
                                    }
                                }
                                .frame(height: 10)
                                .padding(7)
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(self.infraViewModel.infraSportModel, id: \.self) { infraSportModel in
                                            
                                            NavigationLink(destination: FacilityDetailView(infraModel: infraSportModel), isActive: $isSportShowing) {
                                                Button(action: {
                                                    self.isSportShowing = true
                                                    self.infraViewModel.setInfra(infraObject: infraSportModel)
                                                }) {
                                                    VStack(spacing: 0) {
                                                        if infraSportModel.attachFiles!.count > 0 {
                                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraSportModel.attachFiles![0].saveFilePath!, title: infraSportModel.name!, width: 100, height: 100)
                                                        } else {
                                                            HomeImageView(image: "search_default_image", width: 100, height: 100)
                                                        }
                                                        Text(infraSportModel.name!)
                                                            .frame(width: 100, height: 15)
                                                            .font(.system(size:12))
                                                            .foregroundColor(.white)
                                                            .background(Color.black)
                                                            .opacity(0.8)
                                                    }
                                                }
                                            }
                                            .navigationBarTitle("전지훈련팀", displayMode: .inline)
                                            
                                            
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
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        HomeTextView(title: "전체", category: "부대시설")
                                        
                                        ForEach(self.infraCViewModel.infraCFacilityModel, id: \.self) { infraMenu in
                                            HomeTextView(title: "\(infraMenu.name!)", category: "부대시설")
                                        }
                                    }
                                }
                                .frame(height: 10)
                                .padding(7)
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(self.infraViewModel.infraFacilityModel, id: \.self) { infraFacilityModel in
                                            
                                            NavigationLink(destination: FacilityDetailView(infraModel: infraFacilityModel), isActive: $isFacilityShowing) {
                                                Button(action: {
                                                    self.isFacilityShowing = true
                                                    self.infraViewModel.setInfra(infraObject: infraFacilityModel)
                                                }) {
                                                    VStack(spacing:0) {
                                                        if infraFacilityModel.attachFiles!.count > 0 {
                                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraFacilityModel.attachFiles![0].saveFilePath!, title: infraFacilityModel.name!, width: 100, height:100)
                                                        } else {
                                                            HomeImageView(image: "search_default_image", width: 100, height: 100)
                                                        }
                                                        Text(infraFacilityModel.name!)
                                                            .frame(width: 100, height: 15)
                                                            .font(.system(size:12))
                                                            .foregroundColor(.white)
                                                            .background(Color.black)
                                                            .opacity(0.8)
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
                        }
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


//                        HStack(){
//                            Text("전지훈련팀 스토리")
//                                .font(.system(size:20))
//                                .fontWeight(.black)
//                                .frame(height: 20, alignment: .leading)
//                                .padding(.leading, 10)
//                            Spacer()
//                        }

//                        ScrollView (.horizontal, showsIndicators: false) {
//                            HStack {
//                                ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
//
//                                    NavigationLink(destination: Text(verbatim: "구현 중")) {
//                                        ForEach(infraFoodModel.attachFiles!, id: \.self) {
//                                            infraModel in
//                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "", width:100, height:100)
//                                        }
//                                    }
//                                    //                                .navigationBarTitle("HomeView")
//
//
//                                }
//                            }
//                        }
//                        .frame(height: 100)
//                        .padding(5).padding(.bottom,20)

