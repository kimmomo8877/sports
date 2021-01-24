//
//  TrackerMain.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/22.
//

import SwiftUI

struct TrackerMain: View {
    @ObservedObject private var bandVm = BandViewModel()
    let age:Int
    let weight:Int
    
    var body: some View {
        VStack {
            Text("Tracker Main page : age-\(age), weight-\(weight)")
            List(self.bandVm.activities, id: \.timestamp) { activity in
                Text("time : \(convertDateToString(targetDate: activity.timestamp)), walk : \(activity.walk)")
            }
            Button("Check") {
                bandVm.getActivity()
            }
        }.onAppear {
            self.bandVm.refreshActivity()
        }
        
    }
}

private extension TrackerMain {
    func convertDateToString(targetDate: Date) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: targetDate)
    }
}

struct TrackerMain_Previews: PreviewProvider {
    static var previews: some View {
        TrackerMain(age:20, weight:70)
    }
}
