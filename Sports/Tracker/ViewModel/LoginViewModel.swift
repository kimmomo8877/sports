//
//  LoginViewModel.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/02/04.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    static let shared: LoginViewModel = {
        let instance = LoginViewModel()
        return instance
    }()
    
    @Published var targetList = [TargetInfoModel]()
    @Published var isLogined = false
    
    init() {
        let userNo = UserDefaults.standard.string(forKey: "userNo")
        if (userNo != nil) {
            isLogined = true
        }
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "userNo")
        UserDefaults.standard.removeObject(forKey: "accessToken")
        UserDefaults.standard.removeObject(forKey: "targetNo")
        UserDefaults.standard.synchronize()
        
        self.isLogined = false
    }
    
    func loginRequestWithGetUserNo(email: String, password: String) {
        let jsonDict:[String: Any] = ["email": email, "password": password]
        
        let url = URL(string: "http://www.kbostat.co.kr/auth/auth/login")!
        let serializedData = try! JSONSerialization.data(withJSONObject: jsonDict, options: [])
        let toRequestjsonText = String(decoding: serializedData, as: UTF8.self)
        print("requestBody : \(toRequestjsonText)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = serializedData
        
        let task = URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
            if error != nil {
                print("requestError :", error!)
                DispatchQueue.main.async {
                    self.isLogined = false
                }
                return
            }
            
            do {
                guard let data = data else { return }
                guard let resultData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return }
                
                let accessToken = resultData["accessToken"] as? String
                if accessToken != nil {
                    print("Access token : \(accessToken!)")
                    getUserNo(token: accessToken!)
                } else {
                    DispatchQueue.main.async {
                        self.isLogined = false
                    }
                }
                
            } catch {
                print("responseJsonParsingError")
            }
        }
        
        task.resume()
    }
    
    func getUserNo(token: String) {
        let url = URL(string: "http://www.kbostat.co.kr/auth/user/me")!
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    self.isLogined = false
                }
                return
            }
            //TODO: 로그인 실패
            do {
                guard let data = data else { return }
                guard let resultData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return }
                
                let userNo = resultData["userNo"]
                
                UserDefaults.standard.set(token, forKey: "accessToken")
                UserDefaults.standard.set(userNo, forKey: "userNo")
                UserDefaults.standard.synchronize()
                DispatchQueue.main.async {
                    self.isLogined = true
                }
            } catch {
                self.isLogined = false
                print("responseJsonParsingError :")
            }
        }
        
        task.resume()
    }
    
    func getTargetList(userNo: String) {
        let jsonDict:[String: String] = ["userNo": userNo]
        
        let url = URL(string: "http://www.kbostat.co.kr/resource/target/infor/byUserNo")!
        let serializedData = try! JSONSerialization.data(withJSONObject: jsonDict, options: [])
        let toRequestjsonText = String(decoding: serializedData, as: UTF8.self)
        print("requestBody : \(toRequestjsonText)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = serializedData
        
        let task = URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
            if error != nil {
                print("requestError :", error!)
                return
            }
            
            do {
                guard let data = data else { return }
                let targetData:TargetModel = try JSONDecoder().decode(TargetModel.self, from: data)
                DispatchQueue.main.async {
                    self.targetList = Array(targetData.targetInfo[0 ..< (targetData.targetInfo.count)])
                    //                    if targetData.targetInfo.count > 0 {
                    //                        self.showTargetList = true
                    //                    }
                }
            } catch {
                print("responseJsonParsingError")
            }
        }
        
        task.resume()
    }
}
