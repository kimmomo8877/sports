//
//  HttpHandler.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/31.
//

import Foundation

class BandHttpHandler {
    static func sendPost(urlString:String, jsonDict:[String: Any]) {
        let url = URL(string: urlString)!
        let serializedData = try! JSONSerialization.data(withJSONObject: jsonDict, options: [])
        let toRequestjsonText = String(decoding: serializedData, as: UTF8.self)
        print("requestBody : \(toRequestjsonText)")

        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = serializedData

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("requestError :", error)
                //TODO: 실패시 예외처리 로직 추가하기
                return
            }

            do {
                guard let data = data else { return }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return }
                print("responseJson :", json)
            } catch {
                print("responseJsonParsingError :", error)
            }
        }

        task.resume()
    }
    
    static func sendHR(hrData: BandHrRawModel) {
        let timestamp = hrData.Date! + " " + hrData.Time!
        let toSendBody:[String: Any] = ["targetExerNo": 100, "tracking": ["timestamp": timestamp, "hr": hrData.HR!]]
        sendPost(urlString: "http://www.kbostat.co.kr/resource/tracking/exercise", jsonDict: toSendBody)
    }

    static func sendAct(actData: BandActivityRawModel) {
        let timestamp = actData.Date + " " + actData.Time
        let toSendBody:[String: Any] = ["targetExerNo": 100, "tracking": ["timestamp": timestamp, "walk": actData.Walk,
                                                                          "walkCalories": actData.WalkCalories]]
        sendPost(urlString: "http://www.kbostat.co.kr/resource/tracking/exercise", jsonDict: toSendBody)
    }
    
    static func sendInbody(inBodyData: BandInbodyRawModel) {
        let timestamp = inBodyData.Date + " " + inBodyData.Time
        let toSendBody:[String: Any] = ["targetExerNo": 100, "tracking": ["timestamp": timestamp, "pbf": inBodyData.PBF!,
                                                                          "ffm": inBodyData.FFM!, "tbw": inBodyData.TBW!, "imp": inBodyData.IMP!]]
        sendPost(urlString: "http://www.kbostat.co.kr/resource/tracking/exercise", jsonDict: toSendBody)
    }
}
