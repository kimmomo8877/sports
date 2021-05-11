//
//  LoginView.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/02/04.
//

import SwiftUI
import PartialSheet
import Introspect

struct LoginView: View {
    @ObservedObject var loginViewModel:LoginViewModel = LoginViewModel.shared
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @State var isFinish: Bool = false;
    @State var email: String = "teamadmin@kbostat.co.kr"
    @State var password: String = "test1234!!"
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text("로그인 해주세요.")
                .font(.largeTitle)
                .padding(.bottom, 20)
            HStack {
                TextField("email", text: $email)
                    .padding(15)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .keyboardType(.emailAddress)
                    .introspectTextField { textField in
                        textField.becomeFirstResponder()
                    }
                Button(action: {
                    self.email = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.secondary)
                }
            }
            .padding(.bottom, 5)
            HStack {
                SecureField("password", text: $password)
                    .padding(15)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                Button(action: {
                    self.password = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.secondary)
                }
            }
            .padding(.bottom, 5)
            
            
            if loginViewModel.isLogined == true {
                Button(action: {
                    partialSheetManager.closePartialSheet()
                }, label: {
                    Text("로그인 완료 (닫기)")
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .cornerRadius(10)
                })
            } else {
                Button(action: {
                    loginViewModel.loginRequestWithGetUserNo(email: self.email, password: self.password)
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
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
