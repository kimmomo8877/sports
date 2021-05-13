//
//  MyView.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/02/05.
//

import SwiftUI
import PartialSheet

struct MyView: View {
    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel.shared
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    if self.loginViewModel.isLogined {
                        Text("\(self.loginViewModel.name)")
                            .bold()
                            .font(.title2)
                        Text("\(self.loginViewModel.email)")
                    } else {
                        Text("로그인해주세요.")
                            .bold()
                            .font(.title2)
                        Text("")
                    }
                    Text("")
                }
                Spacer()
                VStack {
//                    Text("IMAGE")
                    Image(systemName: "person")
                        .font(.system(size: 80))
                        .border(Color.blue)

                }
            }
            
            
            Spacer()
            if self.loginViewModel.isLogined {
                Button(action: {
                    self.loginViewModel.logout()
                }, label: {
                    Text("Logout")
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .cornerRadius(10)
                })
            } else {
                Button(action: {
                    self.partialSheetManager.showPartialSheet({
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
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
