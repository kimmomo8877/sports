//
//  SearchViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/16.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var searchTeam = [TeamModel]()
    @Published var searchInfra = [InfraModel]()
    
    init () {
        
    }
    
    func searchInfra(searchWord: String) {
        self.searchInfra.removeAll()
        let url_string = "http://www.kbostat.co.kr/resource/infra?searchWord=" + searchWord
        print(url_string)
        if searchWord == "" { return }
        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: encoded!) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.searchInfra = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
            }
        }
        task.resume()
    }
    
    func searchTeam(searchWord: String) {
        self.searchTeam.removeAll()
        let url_string = "http://www.kbostat.co.kr/resource/team?searchWord=" + searchWord
        print(url_string)
        if searchWord == "" { return }
        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: encoded!) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([TeamModel].self, from: data!)
                        self.searchTeam = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
            }
        }
        task.resume()
    }

}


//    init(searchWord: String) {
//        let url_string = "http://www.kbostat.co.kr/resource/search?searchWord=" + searchWord
//        print(url_string)
//        if searchWord == "" { return }
//        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//        guard let url = URL(string: encoded!) else { return }
//
//       let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
//        if err != nil {
//            print("URL Error")
//        } else {
//            DispatchQueue.main.async {
//                do {
//                let allData = try JSONDecoder().decode([SearchModel].self, from: data!)
//                self.searchModel = Array(allData[0 ..< (allData.count)])
////                let searchtemp = Array(allData[0 ..< (allData.count)])
////                print(searchtemp)
//                } catch {
//                    print("JSON Decoder Error")
//                }
//            }
//        }
//       }
//        task.resume()
//    }


//                        for (model) in self.searchModel {
//                            if model.searchType == "TEAM" {
//                                self.searchTeam.append(model)
//                            } else {
//                                self.searchInfra.append(model)
//                            }
//                        }
