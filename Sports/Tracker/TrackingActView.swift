//
//  TrackingView.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/30.
//

import SwiftUI

struct TrackingActView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject private var bandVm: BandActViewModel
    @State var counter = 0
    @State var displayTime = "0"
    let startTime: Date
    let secondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let minuteTimer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    @State var trackingTime = 0
    
    init(startTime: Date) {
        self.startTime = startTime
        self.bandVm = BandActViewModel.shared
        print("init : \(startTime)")
    }
    
    var body: some View {
        ZStack {
            VStack {
                infoGroup
                    .onReceive(minuteTimer) { input in
                        print("onMinuteTimer : \(input)")
                        if (bandVm.isLoading == false && bandVm.isRunning) {
                            bandVm.getActivity(isEnd: false)
                        }
                    }
                Text("Time")
                Text("\(self.displayTime)")
                    .font(.title)
                    .bold()
                    .onReceive(secondTimer) { input in
                        if bandVm.isRunning {
                            let min = Int(trackingTime / 60)
                            let second = Int(trackingTime % 60)
                            self.displayTime = String(min) + "." + String(second)
                            trackingTime += 1
                        }
                    }
                Spacer()
                statusGroup
                Spacer()
                firstButtonGroup
                Text("")
                secondButtonGroup
                Spacer()
                
            }
            .padding()
            
            if self.bandVm.isLoading {
                GeometryReader {geo in
                    Loader()
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                }
                .background(Color.black.opacity(0.45))
                .edgesIgnoringSafeArea(.all)
                
            }
        }
    }
}

private extension TrackingActView {
    func endTracking() {
        self.bandVm.getActivity(isEnd: false)
        self.presentation.wrappedValue.dismiss()
    }
    
    func togglePause() {
        bandVm.toggleIsRunning()
    }
    
    var firstButtonGroup: some View {
        Group {
            HStack(spacing: 20) {
                Button(action: { bandVm.getActivity(isEnd: false) }, label: {
                    Text("Refresh ACT")
                        .frame(width: 120, height: 40, alignment: .center)
                        .background(bandVm.isRunning ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })
                .disabled(!bandVm.isRunning)
                
                Button(action: { bandVm.runHR() }, label: {
                    Text("Start HR")
                        .frame(width: 80, height: 40, alignment: .center)
                        .background(bandVm.isRunning ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })
                .disabled(!bandVm.isRunning)
                
                Button(action: { bandVm.runInBody() }, label: {
                    Text("Start BCA")
                        .frame(width: 120, height: 40, alignment: .center)
                        .background(bandVm.isRunning ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })
                .disabled(!bandVm.isRunning)
            }
        }
    }
    
    var secondButtonGroup: some View {
        Group {
            HStack(spacing: 25) {
                Button(action: { togglePause() }, label: {
                    Text("Pause")
                        .frame(width: 80, height: 40, alignment: .center)
                        .background(bandVm.isRunning ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })
                .disabled(!bandVm.isRunning)
                
                Button(action: { bandVm.setProfileSync() }, label: {
                    Text("Start")
                        .frame(width: 80, height: 40, alignment: .center)
                        .background(!bandVm.isRunning ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })
                .disabled(bandVm.isRunning)
                
                Button(action: { endTracking() }, label: {
                    Text("Stop")
                        .frame(width: 80, height: 40, alignment: .center)
                        .background(bandVm.isRunning ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })
                .disabled(!bandVm.isRunning)
            }
        }
    }
    
    var infoGroup: some View {
        Group {
            HStack(spacing: 80) {
                VStack(alignment: .leading) {
                    Text("보행수").foregroundColor(.gray)
                    HStack {
                        Text("\(bandVm.trackingCount)")
                            .font(.title).bold().foregroundColor(.gray)
                        Text("걸음").foregroundColor(.gray)
                    }
                }
                .frame(width: 130, height: 100, alignment: .center)
                .background(Color(hue: 0.562, saturation: 0.193, brightness: 0.936))
                .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text("거리").foregroundColor(.gray)
                    HStack {
                        Text("\(bandVm.trackingDistance)")
                            .font(.title).bold().foregroundColor(.gray)
                        Text("m").foregroundColor(.gray)
                    }
                }
                .frame(width: 130, height: 100, alignment: .center)
                .background(Color(hue: 0.562, saturation: 0.193, brightness: 0.936))
                .cornerRadius(10)
            }
            .padding()
            
            HStack(spacing: 80) {
                VStack (alignment: .leading) {
                    Text("칼로리").foregroundColor(.gray)
                    HStack {
                        Text("\(bandVm.trackingCalories)")
                            .font(.title).bold().foregroundColor(.gray)
                        Text("kcal").foregroundColor(.gray)
                    }
                }
                .frame(width: 130, height: 100, alignment: .center)
                .background(Color(hue: 0.562, saturation: 0.193, brightness: 0.936))
                .cornerRadius(10)
                
                VStack (alignment: .leading) {
                    Text("보행시간").foregroundColor(.gray)
                    HStack {
                        Text("\(bandVm.trackingTime)")
                            .font(.title).bold().foregroundColor(.gray)
                        Text("min").foregroundColor(.gray)
                    }
                }
                .frame(width: 130, height: 100, alignment: .center)
                .background(Color(hue: 0.562, saturation: 0.193, brightness: 0.936))
                .cornerRadius(10)
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
