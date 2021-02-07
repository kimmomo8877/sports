//
//  TrackingView.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/30.
//

import SwiftUI
import PopupView

struct TrackingActView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject private var bandVm: BandActViewModel = BandActViewModel.shared
    @State var counter: Int = 0
    @State var displayTime = "0"
    @State var loadingMessage: String = "밴드에 접근중입니다..."
    @State var showingPopup = false

    let secondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    let minuteTimer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    init(startTime: Date) {
        print("init : \(startTime)")
    }
    
    var body: some View {
        ZStack {
            VStack {
                infoGroup
                Text("Time")
                Text("\(self.displayTime)")
                    .font(.title)
                    .bold()
                    .onReceive(secondTimer) { input in
                        if bandVm.isRunning {
                            let min = Int(counter / 60)
                            let second = Int(counter % 60)
                            self.displayTime = String(min) + "." + String(second)
                            
                            if second == 59 {
                                bandVm.getActivity(isEnd: false)
                            }
                            
                            self.counter += 1
                            
                            
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
//        .popup(isPresented: $bandVm.showingPopup, type: .floater(verticalPadding: 100), position: .bottom,
//               animation: .easeInOut, closeOnTap: true, closeOnTapOutside: true) {
//            HStack {
//                Text("\(bandVm.status)")
//            }
//            .frame(width: 200, height: 60)
//            .background(Color(red: 0.85, green: 0.8, blue: 0.95))
//            .cornerRadius(30.0)
//        }
    }
}

private extension TrackingActView {
    func endTracking() {
        self.bandVm.getActivity(isEnd: true)
        //        self.presentation.wrappedValue.dismiss()
    }
    
    func togglePause() {
        bandVm.toggleIsRunning()
    }
    
    var firstButtonGroup: some View {
        Group {
            HStack(spacing: 25) {
                //                Button(action: { bandVm.getActivity(isEnd: false) }, label: {
                //                    Text("Refresh ACT")
                //                        .frame(width: 120, height: 40, alignment: .center)
                //                        .background(bandVm.isRunning ? Color.blue : Color.gray)
                //                        .foregroundColor(Color.white)
                //                        .cornerRadius(8)
                //                })
                //                .disabled(!bandVm.isRunning)
                
                Button(action: {
                    loadingMessage = "밴드에 손가락을 올려주세요..."
                    bandVm.runHR()
                }, label: {
                    Text("심박 측정")
                        .frame(width: 150, height: 40, alignment: .center)
                        .background(bandVm.isRunning ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })
                .disabled(!bandVm.isRunning)
                
                Button(action: {
                    loadingMessage = "밴드에 손가락을 올려주세요..."
                    bandVm.runInBody()
                }, label: {
                    Text("인바디 측정")
                        .frame(width: 150, height: 40, alignment: .center)
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
                //                Button(action: { togglePause() }, label: {
                //                    Text("Pause")
                //                        .frame(width: 80, height: 40, alignment: .center)
                //                        .background(bandVm.isRunning ? Color.blue : Color.gray)
                //                        .foregroundColor(Color.white)
                //                        .cornerRadius(8)
                //                })
                //                .disabled(!bandVm.isRunning)
                
                Button(action: {
                    bandVm.initActivity()
                    bandVm.initTrackingData()
                    self.counter = 0
//                    bandVm.setFactoryReset()
                }, label: {
                    Text("운동 시작")
                        .frame(width: 150, height: 40, alignment: .center)
                        .background(!bandVm.isRunning ? Color.blue : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })
                .disabled(bandVm.isRunning)
                
                Button(action: {
                    endTracking()
                }, label: {
                    Text("운동 종료")
                        .frame(width: 150, height: 40, alignment: .center)
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
            HStack(spacing: 30) {
                VStack(alignment: .leading) {
                    Text("보행수").foregroundColor(.gray)
                    HStack {
                        Text("\(bandVm.trackingCount)")
                            .font(.title).bold().foregroundColor(.gray)
                        Text("걸음").foregroundColor(.gray)
                    }
                }
                .frame(width: 150, height: 100, alignment: .center)
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
                .frame(width: 150, height: 100, alignment: .center)
                .background(Color(hue: 0.562, saturation: 0.193, brightness: 0.936))
                .cornerRadius(10)
            }
            .padding()
            
            HStack(spacing: 30) {
                VStack (alignment: .leading) {
                    Text("칼로리").foregroundColor(.gray)
                    HStack {
                        Text("\(bandVm.trackingCalories)")
                            .font(.title).bold().foregroundColor(.gray)
                        Text("kcal").foregroundColor(.gray)
                    }
                }
                .frame(width: 150, height: 100, alignment: .center)
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
                .frame(width: 150, height: 100, alignment: .center)
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
        }
    }
}

struct Loader: View {
    @State var animate = false
    @Binding var loadingMessage: String
    
    init(loadingMessage: Binding<String> = .constant("밴드에 접근중입니다..")) {
        _loadingMessage = loadingMessage
    }
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [.red, .orange]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
            Text("\(loadingMessage)").padding(.top)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(15)
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
