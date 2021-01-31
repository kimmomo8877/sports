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
            Text("트래커 실행에 필요한 나이와 체중을 입력해주세요.")
                .font(.title)
                .padding()
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 350, height: 80)
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 350, height: 80)
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            NavigationLink(
                destination: TrackerMainView(age: 20, weight: 50),
                label: {
                    Text("설정완료")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .cornerRadius(8)
                })
            Spacer()
        }
        .navigationBarTitle("트래커 설정")
    }
}

struct Tracker_Previews: PreviewProvider {
    static var previews: some View {
        TrackingConfigView()
    }
}
