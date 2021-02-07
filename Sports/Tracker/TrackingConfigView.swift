//
//  Tracker.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/21.
//

import SwiftUI
import PartialSheet

struct TrackingConfigView: View {
    @ObservedObject var loginViewModel:LoginViewModel = LoginViewModel.shared
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @State var showTrackerMain = false
    @State var isSheetShown = false
    @State var selectedCenter = 0
    
    @State var age = "25"
    @State var height = "175"
    @State var weight = "70"
    
    var body: some View {
        VStack (alignment: .leading) {
            NavigationLink(
                destination: TrackerMainView(age: Int(self.age)!, weight: Int(self.weight)!),
                isActive: $showTrackerMain,
                label: {
                    EmptyView()
                })
            
            if (self.loginViewModel.isLogined) {
                Text("나이")
                TextField("나이", text: $age)
                    .keyboardType(.decimalPad)
                    .padding(15)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .disabled(true)
                Text("몸무게")
                TextField("몸무게", text: $weight)
                    .keyboardType(.decimalPad)
                    .padding(15)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .disabled(true)
                Text("키")
                TextField("키", text: $height)
                    .keyboardType(.decimalPad)
                    .padding(15)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .disabled(true)
                
                if (self.loginViewModel.targetList.count > 0) {
                    Picker(selection: $selectedCenter, label: Text("센터를 선택해주세요.")) {
                        ForEach(0 ..< self.loginViewModel.targetList.count, id: \.self) {
                            Text(String(self.loginViewModel.targetList[$0].infra.name))
                        }
                    }
                    .padding(.top, 100)
                    .frame(height: 50)
                }
                
                Spacer()
                
                if (self.loginViewModel.targetList.count > 0) {
                    Button(action: {
                        // TargetNo 저장
                        UserDefaults.standard.set(self.loginViewModel.targetList[self.selectedCenter].targetNo, forKey: "targetNo")
                        self.showTrackerMain = true
                    }, label: {
                        Text("설정완료")
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .font(.title2)
                            .cornerRadius(8)
                    })
                } else {
                    Text("센터 예약이 된 사용자에 한해서 트래커 사용이 가능합니다.")
                }
            } else {
                Button(action: {
                    self.partialSheetManager.showPartialSheet({
                        let userNoData: String? = UserDefaults.standard.string(forKey: "userNo")
                        guard let userNo = userNoData else { return }
                        self.loginViewModel.getTargetList(userNo: userNo)
                    }) {
                        LoginView()
                    }
                }, label: {
                    Text("Login")
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .cornerRadius(10)
                })
            }
        }
        .padding()
        .navigationBarTitle("트래커 설정")
        .onAppear(perform: {
            if (!loginViewModel.isLogined) {
                self.partialSheetManager.showPartialSheet({
                    let userNoData: String? = UserDefaults.standard.string(forKey: "userNo")
                    guard let userNo = userNoData else { return }
                    self.loginViewModel.getTargetList(userNo: userNo)
                }) {
                    LoginView()
                }
            } else {
                let userNoData: String? = UserDefaults.standard.string(forKey: "userNo")
                guard let userNo = userNoData else { return }
                self.loginViewModel.getTargetList(userNo: userNo)
            }
        })
    }
}

struct Tracker_Previews: PreviewProvider {
    static var previews: some View {
        TrackingConfigView()
    }
}
