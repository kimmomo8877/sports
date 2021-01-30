//
//  SearchViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/16.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchModel = [SearchModel]()

    init(searchWord: String) {
        let url_string = "http://www.kbostat.co.kr/resource/search?searchWord=" + searchWord
        print(url_string)
        if searchWord == "" { return }
        print("hh")
        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: encoded!) else { return }

       let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
        if err != nil {
            print("URL Error")
        } else {
            DispatchQueue.main.async {
                do {
                let allData = try JSONDecoder().decode([SearchModel].self, from: data!)
                self.searchModel = Array(allData[0 ..< (allData.count)])
//                let searchtemp = Array(allData[0 ..< (allData.count)])
//                print(searchtemp)
                } catch {
                    print("JSON Decoder Error")
                }
            }
        }
       }
        task.resume()
    }
    
//    func call_json(searchWord: String) {
//
//        let url_string = "http://www.kbostat.co.kr/resource/search?searchWord=" + searchWord
//        print(url_string)
//        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//        guard let url = URL(string: encoded!) else { return }
//
//       let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            DispatchQueue.main.async {
//                let allData = try! JSONDecoder().decode([SearchModel].self, from: data!)
//                self.searchData = Array(allData[0 ..< (allData.count)])
////                let searchtemp = Array(allData[0 ..< (allData.count)])
////                print(searchtemp)
//            }
//        }
//        task.resume()
//    }
}
