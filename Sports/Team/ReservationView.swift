//
//  ReservationView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/10.
//

import SwiftUI
//import RKCalendar

struct ReservationView: View {
    @EnvironmentObject var infraViewModel:InfraViewModel
    @State var showCalendar1 = false
    @State var showCalendar2 = false
    
    @ObservedObject var rkManager1 = RKManager(calendar: Calendar.current, minimumDate: Date().addingTimeInterval(60*24*60), maximumDate: Date().addingTimeInterval(60*60*24*90), mode: .singleDate)
    @ObservedObject var rkManager2 = RKManager(calendar: Calendar.current, minimumDate: Date().addingTimeInterval(60*24*60), maximumDate: Date().addingTimeInterval(60*60*24*90), mode: .singleDate)
    
    var body: some View {
        
        VStack() {
            HStack {
                if infraViewModel.infraObject[0].attachFiles!.count > 0 {
                    ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraViewModel.infraObject[0].attachFiles![0].saveFilePath!, title: "", width: 50, height: 50)
                } else {
                    Image("search_default_image")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                VStack {
                    Text("\(infraViewModel.infraObject[0].name ?? "")")
                    Text("\(infraViewModel.infraObject[0].address ?? "")").foregroundColor(.secondary)
                        .font(Font.system(size:15))
                }
            }.padding(.leading, 10)
            
            
            Button(action: { self.showCalendar1.toggle() }) {
                Text("시작일").foregroundColor(.blue)
            }
            .sheet(isPresented: $showCalendar1) {
                                    RKCalendarView().environmentObject(rkManager1)
                            }
            
            Text(self.getTextFromDate(date: self.rkManager1.selectedDate))
            
            Button(action: { self.showCalendar2.toggle() }) {
                Text("종료일").foregroundColor(.blue)
            }
            .sheet(isPresented: $showCalendar2) {
                                    RKCalendarView().environmentObject(rkManager2)
                            }
            
            Text(self.getTextFromDate(date: self.rkManager2.selectedDate))
            
            Spacer()
        }
//        .onAppear(perform: startUp)
    }
    
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
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


