//
//  TrackingView.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/30.
//

import SwiftUI

struct TrackingActView: View {
    @ObservedObject private var bandVm = BandViewModel()
    @State var counter = 0
    @State var displayTime = "0"
    var startTime: Date
    let secondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let minuteTimer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    init(startTime: Date) {
        self.startTime = startTime
    }
    
    var body: some View {
        ZStack {
            VStack {
                infoGroup
                    .onReceive(minuteTimer) { input in
                        print("onMinuteTimer : \(input)")
                        if (bandVm.isLoading == false) {
                            bandVm.getActivity()
                        }
                    }
                Text("Time")
                Text("\(self.displayTime)")
                    .font(.title)
                    .onReceive(secondTimer) { input in
                        let diffTime = Int(Date().timeIntervalSince(startTime))
                        let min = Int(diffTime / 60)
                        let second = Int(diffTime % 60)
                        self.displayTime = String(min) + "." + String(second)
                        counter += 1
                    }
                Spacer()
                statusGroup
                Spacer()
                HStack(spacing: 50) {
                    Button(action: { bandVm.getActivity() }, label: {
                        Text("Refresh ACT")
                    })
                    
                    Button(action: { bandVm.runHR() }, label: {
                        Text("Start HR")
                    })
                    
                    Button(action: { bandVm.runInBody() }, label: {
                        Text("Start BCA")
                    })
                }
                Spacer()
            }
            .padding()
            
            if self.bandVm.isLoading {
                GeometryReader {_ in
                    Loader()
                }
                .background(Color.black.opacity(0.45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
            }
        }
    }
}

private extension TrackingActView {
    var infoGroup: some View {
        Group {
            HStack(spacing: 100) {
                VStack(alignment: .leading) {
                    Text("보행수")
                    HStack {
                        Text("\(bandVm.lastActivity?.Walk ?? 0)")
                            .font(.title)
                        Text("걸음")
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("거리")
                    HStack {
                        Text("\(bandVm.lastActivity?.WalkDistance ?? 0)")
                            .font(.title)
                        Text("m")
                    }
                }
            }
            .padding()
            
            HStack(spacing: 100) {
                VStack (alignment: .leading) {
                    Text("칼로리")
                    HStack {
                        Text("\(bandVm.lastActivity?.WalkCalories ?? 0)")
                            .font(.title)
                        Text("kcal")
                    }
                }
                
                VStack (alignment: .leading) {
                    Text("보행시간")
                    HStack {
                        Text("\(bandVm.lastActivity?.WalkTime ?? 0)")
                            .font(.title)
                        Text("min")
                    }
                }
            }
            .padding()
        }
    }
    
    var statusGroup: some View {
        Group {
            Text("Status - \(bandVm.status)")
            Text("HR - \(bandVm.lastHR?.HR ?? 0)")
            Text("Counter - \(counter)")
        }
    }
}

struct Loader: View {
    @State var animate = false
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [.red, .orange]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
        }
        .onAppear {
            self.animate.toggle()
        }
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingActView(startTime: Date())
    }
}
