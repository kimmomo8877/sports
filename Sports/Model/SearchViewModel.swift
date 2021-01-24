//
//  SearchViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/16.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchData = [SearchModel]()
    
    init() {
        
    }
    
//    init(searchWord: String) {
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
    
    func call_json(searchWord: String) {

        let url_string = "http://www.kbostat.co.kr/resource/search?searchWord=" + searchWord
        print(url_string)
        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: encoded!) else { return }

       let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                let allData = try! JSONDecoder().decode([SearchModel].self, from: data!)
                self.searchData = Array(allData[0 ..< (allData.count)])
//                let searchtemp = Array(allData[0 ..< (allData.count)])
//                print(searchtemp)
            }
        }
        task.resume()
    }
}
