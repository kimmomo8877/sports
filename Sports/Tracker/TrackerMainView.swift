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
        ScrollView {
            VStack {
                //            Text("Tracker Main page : age-\(age), weight-\(weight)")
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 70)
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 70)
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 150, height: 150)
                NavigationLink(
                    destination: TrackingActView(startTime: Date()),
                    label: {
                        Text("Start")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(8)
                            .font(.title2)
                    })
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 100)
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 160)
            }
            .padding()
        }
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
