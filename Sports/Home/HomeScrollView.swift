//
//  HomeScrollView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/27.
//

import SwiftUI

//struct HomeScrollView: View {
    
//    var title: String
//    var infraViewModel: InfraViewModel
    
//    var body: some View{
//        Group {
//
//            HStack(){
//                Text(title)
//                    .font(.system(size:20))
//                    .fontWeight(.black)
//                    .frame(height: 20, alignment: .leading)
//            }
//
//
//            ScrollView (.horizontal, showsIndicators: false) {
//                HStack {
//
////                    Button(action:{
////                        self.infraViewModel.isDisplay(title: "전체")
////                    }){
////                        Text("전체")
////                            .frame(width: CGFloat("전체".count) * 20, height: 15, alignment: .center)
////                            .padding(5)
////                            .foregroundColor(Color.white)
////                            .background(Color.black)
////                            .cornerRadius(15)
////                    }
//
//                    ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
//                        if infraFoodModel.name != nil {
//                            HomeTextView(title: "\(infraFoodModel.name!)")
//                        }
//                    }
//                }
//            }
//            .frame(height: 30)
//            .padding(5)
//
//
//
//            ScrollView (.horizontal, showsIndicators: false) {
//                HStack {
//                    ForEach(self.infraViewModel.infraFoodModel, id: \.self) { infraFoodModel in
//
//                        NavigationLink(destination: Text(verbatim: "dd")) {
//                            ForEach(infraFoodModel.attachFiles!, id: \.self) {
//                                infraModel in
//                                ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraModel.saveFilePath!, title: "")
//                            }
//                        }
//                        //                                .navigationBarTitle("HomeView")
//
//
//                    }
//                }
//            }
//            .frame(height: 100)
//            .padding(5).padding(.bottom,20)
//
//    }
    
//}
