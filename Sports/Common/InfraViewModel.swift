//
//  InfraViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/14.
//

import SwiftUI

class InfraViewModel: ObservableObject {
    @Published var infraSportModel = [InfraModel]()
    @Published var infraFacilityModel = [InfraModel]()
    @Published var infraTravelModel = [InfraModel]()
    @Published var infraFestivalModel = [InfraModel]()
    @Published var infraHotelModel = [InfraModel]()
    @Published var infraFoodModel = [InfraModel]()
    var infraSport_temp = [InfraModel]()
    @Published var infraModel = [InfraModel]()
    //    @Published var infraSportSoccer = [Infra]()
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=1   스포츠
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=2   부대시설
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=3   관광
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=15  축제
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=16  숙박
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=17  food
    init() {
        
        guard let url1 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=1") else { return }
        
        //        1번 스포츠 카타로그
        //        2번 카타로그별 json 호출
        //        3번 개별 호출 전부 합침,
        //        "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=1?sportId='1000'
        
        
        
        URLSession.shared.dataTask(with: url1) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraSportModel = Array(allData[0 ..< (allData.count)])
                        //                self.infraSport_temp = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                    
                }
                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url2 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=2") else { return }
        
        URLSession.shared.dataTask(with: url2) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraFacilityModel = Array(allData[0 ..< (allData.count)])
                        //                self.infraSport_temp = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                    
                }
                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url3 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=3") else { return }
        
        URLSession.shared.dataTask(with: url3) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraTravelModel = Array(allData[0 ..< (allData.count)])
                        //                self.infraSport_temp = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                    
                }
                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url15 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=15") else { return }
        
        URLSession.shared.dataTask(with: url15) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraFestivalModel = Array(allData[0 ..< (allData.count)])
                        //                self.infraSport_temp = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                    
                }
                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url16 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=16") else { return }
        
        URLSession.shared.dataTask(with: url16) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraHotelModel = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
            }
        }
        .resume()
        
        guard let url17 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=17") else { return }
        
        URLSession.shared.dataTask(with: url17) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraFoodModel = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder error")
                    }
                }
            }
        }
        .resume()
    }
    
    
    func isDisplay(title: String) {
        
        let test_fileter = self.infraSport_temp.filter { infra in
            return infra.sportCode?.name == title
        }
        
        if title != "전체" {
            self.infraSportModel.removeAll()
            self.infraSportModel = self.infraSport_temp.filter { infraModel in
                return infraModel.sportCode?.name == title
            }
        }
        
        print(test_fileter)
        
    }
    
        func search_infra(searchWord: String) {
    
            let url_string = "http://www.kbostat.co.kr/resource/infra/=" + searchWord
            print(url_string)
            let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            guard let url = URL(string: encoded!) else { return }
    
           let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
                DispatchQueue.main.async {
                    let allData = try! JSONDecoder().decode([InfraModel].self, from: data!)
                    self.infraModel = Array(allData[0 ..< (allData.count)])
    //                let searchtemp = Array(allData[0 ..< (allData.count)])
    //                print(searchtemp)
                }
            }
            task.resume()
        }
    
    
}






//        ForEach(self.infraSport, id: \.self) { infra in
//            if infra.sportCode != nil {
//
//
//
////                if infra.sportCode.name == title {
////                    self.infraSportSoccer.append(infra)
////                }
//            }
//        }

//        guard let url1 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=1") else { return }
//
//        URLSession.shared.dataTask(with: url1) { (data, resp, err) in
//            DispatchQueue.main.async {
//                let allData = try! JSONDecoder().decode([Infra].self, from: data!)
//                self.infraSport = Array(allData[0 ..< (allData.count)])
//
//
//            }
//        }
//        .resume()


//ForEach(self.infraSport, id: \.self) { infra in
//    if infra.sportCode != nil {
//      infra.sportCode!.isDisplay = true
////                infra.sportCode!
//    }
//}
