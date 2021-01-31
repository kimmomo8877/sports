//
//  Tracker.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/21.
//

import SwiftUI

struct TrackingConfigView: View {
    var body: some View {
        VStack {
            Text("나이와 체중을 입력해 18")
            NavigationLink(
                destination: TrackerMainView(age: 20, weight: 50),
                label: {
                    Text("Start")
                })
        }
        .navigationBarTitle("Check menu")
    }
}

struct Tracker_Previews: PreviewProvider {
    static var previews: some View {
        TrackingConfigView()
    }
}
