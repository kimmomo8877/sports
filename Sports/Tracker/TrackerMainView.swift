//
//  TrackerMain.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/22.
//

import SwiftUI
import BackgroundTasks

struct TrackerMainView: View {
    let age:Int
    let weight:Int
    
    var body: some View {
        VStack {
            Text("Tracker Main page : age-\(age), weight-\(weight)")
            NavigationLink(
                destination: TrackingActView(startTime: Date()),
                label: {
                    Text("Start ACT")
                })
        }
        //        VStack {
        //            List(self.bandVm.activities, id: \.timestamp) { activity in
        //                Text("time : \(convertDateToString(targetDate: activity.timestamp)), walk : \(activity.walk)")
        //            }
        //
        //        }.onAppear {
        //            self.bandVm.refreshActivity()
        //        }
    }
}

private extension TrackerMainView {
    func convertDateToString(targetDate: Date) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: targetDate)
    }
}

struct TrackerMain_Previews: PreviewProvider {
    static var previews: some View {
        TrackerMainView(age:20, weight:70)
    }
}
