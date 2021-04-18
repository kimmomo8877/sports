//
//  TeamDetailView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/13.
//


import SwiftUI
import PartialSheet

struct TeamDetailView: View {
    //    @EnvironmentObject var partialSheet : PartialSheetManager
    @EnvironmentObject var teamViewModel:TeamViewModel
    @EnvironmentObject var teamDetailViewModel:TeamDetailViewModel
    
    var body: some View {
        GeometryReader { geo in
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
//                    ForEach(teamViewModel.teamObject[0].attachFiles!, id: \.self) {
//                        teamModel in
//                        ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + teamModel.saveFilePath!, title: "", width: geo.size.width, height:150)
//                    }
                }
            }.padding(.bottom, 10)
        
            ScrollView() {
                VStack(alignment: .leading) {
                    Group {
                        if teamViewModel.teamObject.count > 0 {
                          Text(teamViewModel.teamObject[0].name ?? "").padding(.leading, 20).font(.system(size:25))
//                          Text("200km | 축구").padding(.leading, 20).foregroundColor(.secondary)
                        }
                    }
                    VStack { Divider().background(Color.gray) }.padding(CGFloat(20)).foregroundColor(.secondary)
   
                    Group {
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.teamDetailViewModel.teamNoticeBoardModel, id: \.self) { noticeBoardModel in
                                    VStack() {
                                        Text(noticeBoardModel.title!)
                                        Text(noticeBoardModel.content!)
                                        Text(noticeBoardModel.registeDate!)
                                    }
                                }
                            }
                        }
                    }
                    
                    Group {
                    HStack() {
                        Text("소속")
                        Text(teamViewModel.teamObject[0].belongCode?.name ?? "")
                    }
                    HStack() {
                        Text("종목")
                        Text(teamViewModel.teamObject[0].sportCode?.name ?? "")
                    }
                    HStack() {
                        Text("연락처")
                        Text(teamViewModel.teamObject[0].phoneNumber ?? "")
                    }
                    }
                    Text("방문스포츠시설")
                    Group {
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.teamDetailViewModel.teamReservationModel, id: \.self) { reservationModel in
                                    HStack() {

                                        if reservationModel.attachFiles!.count > 0 {
//                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + reservationModel.attachFiles![0].saveFilePath!, title: reservationModel.name!, width:50, height:50)
                                        }
                                        else {
//                                            HomeImageView(image: "search_default_image", width: 50, height: 50)
                                        }
                                        VStack() {
                                            Text(reservationModel.infra?.name ?? "")
                                            Text(reservationModel.registeDate ?? "")
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    Text("팀일정")
                    Text("팀스토리")
                }
            }
        }
        
       
    }
    
}



//                                    NavigationLink(destination: FacilityDetailView(infraModel: infraSportModel), isActive: $isSportShowing) {
//                                        Button(action: {
//                                            self.isSportShowing = true
//                                            self.infraViewModel.setInfra(infraObject: infraSportModel)
//                                        }) {
//                                            if infraSportModel.attachFiles!.count > 0 {
//                                                ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraSportModel.attachFiles![0].saveFilePath!, title: infraSportModel.name!, width: 100, height: 100)
//                                            } else {
//                                                HomeImageView(image: "search_default_image", width: 100, height: 100)
//                                            }
//                                        }
//                                    }
//                                    .navigationBarTitle("전지훈련팀", displayMode: .inline)
