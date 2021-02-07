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
