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
            VStack(alignment: .leading) {
                ScrollView (.horizontal, showsIndicators: false) {
                    
                    HStack {
                        if (teamViewModel.teamObject[0].attachFiles!.count > 0) {
                            ForEach(teamViewModel.teamObject[0].attachFiles!, id: \.self) {
                                teamModel in
                                ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + teamModel.saveFilePath!, title: "", width: geo.size.width, height:150)
                            }
                        } else {
                            HomeImageView(image: "search_default_image", width: geo.size.width, height:150)
                        }
                        
                    }
                }.padding(.bottom, 10)
                
                ScrollView() {
                    
                    Group {
                        HStack() {
                            if teamViewModel.teamObject.count > 0 {
                                Text(teamViewModel.teamObject[0].name ?? "").padding(.leading, 20).font(.system(size:25))
                                //                          Text("200km | 축구").padding(.leading, 20).foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                    }
                    //                    VStack { Divider().background(Color.gray) }.padding(CGFloat(20)).foregroundColor(.secondary)
                    
                    Group {
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack() {
                                ForEach(self.teamDetailViewModel.teamNoticeBoardModel, id: \.self) { noticeBoardModel in
                                    //                                    HStack() {
                                    TeamNoticeBoardView(title:noticeBoardModel.title!, content:noticeBoardModel.content!, registerDate:noticeBoardModel.registeDate!, geo:geo)
                                }
                            }
                            //                            }
                        }
                    }
                    
                    Group {
                        HStack() {
                            Text("소속").foregroundColor(.secondary)
                            Text(teamViewModel.teamObject[0].belongCode?.name ?? "")
                            Spacer()
                        }
                        HStack() {
                            Text("종목").foregroundColor(.secondary)
                            Text(teamViewModel.teamObject[0].sportCode?.name ?? "")
                            Spacer()
                        }
                        HStack() {
                            Text("연락처").foregroundColor(.secondary)
                            Text(teamViewModel.teamObject[0].phoneNumber ?? "")
                            Spacer()
                        }
                    }
                    HStack() {
                        Text("방문스포츠시설")
                        Spacer()
                        Button(action:{
                            
                        }){
                            Text("전제보기")
                                .foregroundColor(.secondary)
                        }
                        
                    }
                    Group {
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.teamDetailViewModel.teamReservationModel, id: \.self) { reservationModel in
                                    HStack() {
                                        if reservationModel.attachFiles!.count > 0 {
                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + reservationModel.attachFiles![0].saveFilePath!, title: "", width:50, height:50)
                                        }
                                        else {
                                            Image("search_default_image")
                                                .resizable()
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                    
                    HStack() {
                        Text("팀일정")
                        Spacer()
                    }
                    Group {
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.teamDetailViewModel.teamScheduleModel, id: \.self) { scheduleModel in
                                    //                                    HStack() {
                                    //                                        if scheduleModel.attachFiles!.count > 0 {
                                    //                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + scheduleModel.attachFiles![0].saveFilePath!, title: "", width:50, height:50)
                                    //                                        }
                                    //                                        else {
                                    //                                            Image("search_default_image")
                                    //                                                .resizable()
                                    //                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    //                                        }
                                    VStack() {
                                        Text(scheduleModel.scheduleNo ?? "")
                                        //                                            Text(reservationModel.registeDate ?? "")
                                    }
                                    //                                    }
                                }
                            }
                        }
                    }
                    
                    HStack() {
                        Text("팀스토리")
                        Spacer()
                    }
                    Group {
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.teamDetailViewModel.teamStoryModel, id: \.self) { teamStoryModel in
                                    //                                    HStack() {
                                    //                                        if scheduleModel.attachFiles!.count > 0 {
                                    //                                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + scheduleModel.attachFiles![0].saveFilePath!, title: "", width:50, height:50)
                                    //                                        }
                                    //                                        else {
                                    //                                            Image("search_default_image")
                                    //                                                .resizable()
                                    //                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    //                                        }
                                    VStack() {
                                        Text(teamStoryModel.title ?? "")
                                        Text(teamStoryModel.content ?? "")
                                        //                                            Text(reservationModel.registeDate ?? "")
                                    }
                                    //                                    }
                                }
                            }
                        }
                    }
                }
            }.padding(.leading, 10)
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
