//
//  CodeViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/04.
//

import SwiftUI

class CodeViewModel: ObservableObject {
    
    @Published var codeRegion = [CodeModel]()
    @Published var codeSport  = [CodeModel]()
    @Published var codeClassification = [CodeModel]()
    
    init () {
        
        guard let url_region = URL(string: "http://www.kbostat.co.kr/resource/code/region") else { return }
        
        URLSession.shared.dataTask(with: url_region) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([CodeModel].self, from: data!)
                        self.codeRegion = Array(allData[0 ..< (allData.count)])
//                        self.setRegionAll()
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
            }
        }.resume()
        
        guard let url_sport = URL(string: "http://www.kbostat.co.kr/resource/code/sport") else { return }
        
        URLSession.shared.dataTask(with: url_sport) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([CodeModel].self, from: data!)
                        self.codeSport = Array(allData[0 ..< (allData.count)])
//                        self.setSportAll()
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
            }
        }.resume()
        
        guard let url_classification = URL(string: "http://www.kbostat.co.kr/resource/code/classification") else { return }
        
        URLSession.shared.dataTask(with: url_classification) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([CodeModel].self, from: data!)
                        self.codeClassification = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
            }
        }.resume()
    }
    
    func setSportAll() {
        for i in 0...self.codeSport.count - 1 {
            self.codeSport[i].isCheck = true
        }
    }
    
    func setSportNonAll() {
        for i in 0...self.codeSport.count - 1 {
            self.codeSport[i].isCheck = false
        }
    }
    
    func setRegionAll() {
        for i in 0...self.codeRegion.count - 1 {
            self.codeRegion[i].isCheck = true
        }
    }
    
    func setRegionNonAll() {
        for i in 0...self.codeRegion.count - 1 {
            self.codeRegion[i].isCheck = false
        }
    }
    
    func setClassificationAll() {
        for i in 0...self.codeClassification.count - 1 {
            self.codeClassification[i].isCheck = true
        }
    }
    
    func setClassificationNonAll() {
        for i in 0...self.codeClassification.count - 1 {
            self.codeClassification[i].isCheck = false
        }
    }
    //                        for (sportMenuModel) in self.infraSportModel {
    //                            if sportMenuModel.sportCode!.name != nil {
    //                                if !self.infraSportMenu.contains(sportMenuModel.sportCode!.name!) {
    //                                    self.infraSportMenu.append(sportMenuModel.sportCode!.name!)
    //                                }
    //                            }
    //                        }

    
    
    //    func searchInfra(searchWord: String) {
    //        self.searchInfra.removeAll()
    //
    //    }
    //
    //    func searchTeam(searchWord: String) {
    //        self.searchTeam.removeAll()
    //        let url_string = "http://www.kbostat.co.kr/resource/team?searchWord=" + searchWord
    //        print(url_string)
    //        if searchWord == "" { return }
    //        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    //        guard let url = URL(string: encoded!) else { return }
    //
    //        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
    //            if err != nil {
    //                print("URL Error")
    //            } else {
    //                DispatchQueue.main.async {
    //                    do {
    //                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
    //                        self.searchInfra = Array(allData[0 ..< (allData.count)])
    //                    } catch {
    //                        print("JSON Decoder Error")
    //                    }
    //                }
    //            }
    //        }
    //        task.resume()
    //    }
    
}

