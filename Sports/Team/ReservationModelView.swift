//
//  ReservationModelView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/13.
//

import SwiftUI
class ReservationViewModel: ObservableObject {
    
    @Published var reservationModel = [ReservationModel]()
    
    init() {
        
    }
    //infraNo : 예약 대상 번호
    //parentInfraNo : 예약 대상 시설의 상위 시설
    //registerNo: 예약 등록자
    //reservaterNo: 예약 대상자
    //reservationStateCodeId: 예약 상태 코드 (default :1001)
    //startDate: 예약
    //endDate: 예약 종료일
    func postReservation(reservation: ReservationModel) {
        
        let jsonDict:[String: Any] = ["infraNo": reservation.infraNo!, "parentInfraNo": reservation.parentInfraNo!,
                                      "registerNo": reservation.registerNo!, "reservaterNo": reservation.reservaterNo!,
                                      "reservationStateCodeId": reservation.reservationStateCodeId!,
                                      "startDate": reservation.startDate!, "endDate": reservation.endDate!]
        
        let url = URL(string: "http://www.kbostat.co.kr/resource/reservation")!
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
//                    self.isLogined = false
                }
                return
            }
            
            do {
                guard let data = data else { return }
                guard let resultData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return }
                
//                let accessToken = resultData["accessToken"] as? String
//                if accessToken != nil {
//                    print("Access token : \(accessToken!)")
//                    getUserNo(token: accessToken!)
//                } else {
//                    DispatchQueue.main.async {
//                        self.isLogined = false
//                    }
//                }
                
            } catch {
                print("responseJsonParsingError")
            }
        }
        
        task.resume()
    }
    
    func setReservation(reservation: ReservationModel) {
        self.reservationModel.removeAll()
        self.reservationModel.append(reservation)
    }

}

extension UIViewController{

func showToast(message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
 }
