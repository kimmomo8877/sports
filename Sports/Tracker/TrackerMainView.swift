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
//    @EnvironmentObject private var bandVm: BandActViewModel
    
    init(age: Int, weight: Int) {
        self.age = age
        self.weight = weight
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 300, height: 70)
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 300, height: 70)
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 150, height: 150)
                    
//                    NavigationLink(destination: TrackingActView(startTime: Date()), tag: 1, selection: $bandVm.isReady) { Text("") }
//                    Button(action: { self.checkBandAndServer() }, label: {
//                        Text("Start")
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(Color.white)
//                            .cornerRadius(8)
//                            .font(.title2)
//                    })
                    
                    NavigationLink(
                        destination: TrackingActView(startTime: Date()),
                        label: {
                            Text("Start")
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .font(.title2)
                                .cornerRadius(10)
                        })

                    
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 300, height: 100)
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 300, height: 160)
                }
                .padding()
                
//                if self.bandVm.isLoading {
//                    GeometryReader {_ in
//                        Loader()
//                    }
//                    .background(Color.black.opacity(0.45))
//                    .edgesIgnoringSafeArea(.all)
//                }
            }
            .navigationBarTitle("트래커")
            
            
        }
    }
    
//    func checkBandAndServer() {
//        if bandVm.isReady == 0 {
//            bandVm.setProfileSync()
//        } else {
//            // 종료 X -> 다시 화면으로
//            bandVm.isReady = 1
//        }
//    }
}

struct StartButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .background(Color.blue)
            .foregroundColor(Color.white)
    }
}

struct LoaderTest: View {
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
