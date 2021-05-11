//
//  ReservationView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/10.
//

import SwiftUI



struct ReservationView: View {
    @EnvironmentObject var infraViewModel:InfraViewModel
    @EnvironmentObject var reservationViewModel:ReservationViewModel
    @State var showCalendar1 = false
    @State var showCalendar2 = false
    @State var showCalendar3 = false
    @State var showCalendar4 = false
    //    @State private var reservationModel:ReservationModel
    
    @ObservedObject var rkManager1 = RKManager(calendar: Calendar.current, minimumDate: Date().addingTimeInterval(60*24*60), maximumDate: Date().addingTimeInterval(60*60*24*90), mode: .singleDate)
    @ObservedObject var rkManager2 = RKManager(calendar: Calendar.current, minimumDate: Date().addingTimeInterval(60*24*60), maximumDate: Date().addingTimeInterval(60*60*24*90), mode: .singleDate)
    @ObservedObject var rkManager3 = RKManager(calendar: Calendar.current, minimumDate: Date().addingTimeInterval(60*24*60), maximumDate: Date().addingTimeInterval(60*60*24*90), mode: .singleDate)
    @ObservedObject var rkManager4 = RKManager(calendar: Calendar.current, minimumDate: Date().addingTimeInterval(60*24*60), maximumDate: Date().addingTimeInterval(60*60*24*90), mode: .singleDate)
    
    var body: some View {
        
        VStack() {
            HStack(spacing:0) {
                if infraViewModel.infraObject[0].attachFiles!.count > 0 {
                    ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraViewModel.infraObject[0].attachFiles![0].saveFilePath!, title: "", width: 100, height: 100)
                } else {
                    Image("search_default_image")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                VStack(alignment: .leading) {
                    Text("\(infraViewModel.infraObject[0].name ?? "")")
                    Text("\(infraViewModel.infraObject[0].address ?? "")").foregroundColor(.secondary)
                        .font(Font.system(size:15))
//                    Spacer()
                }.padding(.leading, 10)
                Spacer()
            }.padding(.top, 20)
            .padding(.leading, 10)
            .padding(.bottom, 5)
            
            VStack { Divider().background(Color.gray) }.padding(CGFloat(20)).foregroundColor(.secondary)
            
            VStack(alignment: .leading) {
                Text("방문희망일").font(Font.system(size:25))
                HStack() {
                    Button(action: { self.showCalendar1.toggle() }) {
                        Text("시작일자").foregroundColor(.black)
                    }
                    .sheet(isPresented: $showCalendar1) {
                        RKCalendarView().environmentObject(rkManager1)
                    }
                    
                    Text(self.getTextFromDate(date: self.rkManager1.selectedDate))
                    Spacer()
                }.padding(.top,7).padding(.leading,3).font(Font.system(size:20))
                
                HStack() {
                    Button(action: { self.showCalendar3.toggle() }) {
                        Text("시작시간").foregroundColor(.black)
                    }
                    .sheet(isPresented: $showCalendar3) {
                        RKCalendarView().environmentObject(rkManager3)
                    }
                    
                    Text(self.getTextFromDate(date: self.rkManager3.selectedDate))
                    Spacer()
                }.padding(.top,7).padding(.leading,3).font(Font.system(size:20))
                
                HStack() {
                    Button(action: { self.showCalendar2.toggle() }) {
                        Text("종료일자").foregroundColor(.black)
                    }
                    .sheet(isPresented: $showCalendar2) {
                        RKCalendarView().environmentObject(rkManager2)
                    }
                    
                    Text(self.getTextFromDate(date: self.rkManager2.selectedDate))
                    Spacer()
                }.padding(.top,7).padding(.leading,3).font(Font.system(size:20))
                
                HStack() {
                    Button(action: { self.showCalendar4.toggle() }) {
                        Text("종료시간").foregroundColor(.black)
                    }
                    .sheet(isPresented: $showCalendar4) {
                        RKCalendarView().environmentObject(rkManager4)
                    }
                    
                    Text(self.getTextFromDate(date: self.rkManager4.selectedDate))
                    Spacer()
                }.padding(.top,7).padding(.leading,3).font(Font.system(size:20))
                
            }.padding(.leading, 10)
            
            //infraNo : 예약 대상 번호
            //teamNo
            //parentInfraNo : 예약 대상 시설의 상위 시설
            //registerNo: 예약 등록자
            //reservaterNo: 예약 대상자
            //reservationStateCodeId: 예약 상태 코드 (default :1001)
            //startDate: 예약
            //endDate: 예약 종료일
            Spacer()
            
            Button(action: {
                var reservationModel = ReservationModel()
                reservationModel.infraNo = infraViewModel.infraObject[0].infraNo
                reservationModel.teamNo = infraViewModel.infraObject[0].infraNo
                reservationModel.parentInfraNo = infraViewModel.infraObject[0].parentInfraNo
                reservationModel.registerNo = "test"
                reservationModel.reservaterNo = "test2"
                reservationModel.reservationStateCodeId = 1001
                reservationModel.startDate = self.getTextFromDate(date: self.rkManager1.selectedDate)
                reservationModel.endDate = self.getTextFromDate(date: self.rkManager2.selectedDate)
                
                if reservationModel.infraNo == nil {
                    reservationModel.errMsg = "infraNo no input"
                } else if reservationModel.parentInfraNo == nil {
                    //                    reservationModel.errMsg = "parentInfraNo no input"
                    reservationModel.parentInfraNo = ""
                }
                
                
                if reservationModel.errMsg == nil {
                    reservationViewModel.postReservation(reservation: reservationModel)
                } else {
                    //                    self.reservationViewModel.showToast(message: reservationModel.errMsg, seconds: 1.0)
                }
            }, label: {
                Text("예약하기")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    
                    
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .font(.title2)
                    .cornerRadius(10)
                    
            }).padding(.leading,10)
            .padding(.trailing,10)
            .padding(.bottom,10)
            
            
            
        }
        //        .onAppear(perform: startUp)
    }
    
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return date == nil ? "" : formatter.string(from: date)
    }
    
    func startUp() {
        
        // example of pre-setting selected dates
        //        let testOnDates = [Date().addingTimeInterval(60*60*24), Date().addingTimeInterval(60*60*24*2)]
        //        rkManager3.selectedDates.append(contentsOf: testOnDates)
        
        // example of some foreground colors
        rkManager1.colors.weekdayHeaderColor = Color.blue
        rkManager1.colors.monthHeaderColor = Color.green
        rkManager1.colors.textColor = Color.blue
        rkManager1.colors.disabledColor = Color.red
        
        // example of pre-setting disabled dates
        //        let testOffDates = [
        //            Date().addingTimeInterval(60*60*24*4),
        //            Date().addingTimeInterval(60*60*24*5),
        //            Date().addingTimeInterval(60*60*24*7)]
        //        rkManager4.disabledDates.append(contentsOf: testOffDates)
    }
}


