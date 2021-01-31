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
    @Published var infraModel = [InfraModel]()
    @Published var infraSportMenu = [String]()
    @Published var sportMenu:String = "전체"
    @Published var sportCategory:String = "스포츠시설"
    @Published var infraFoodMenu = [String]()
    @Published var foodMenu:String = "전체"
    @Published var foodCategory:String = "맛집"
    @Published var infraHotelMenu = [String]()
    @Published var hotelMenu:String = "전체"
    @Published var hotelCategory:String = "숙소"
    
    @Published var infraObject = [InfraModel]()
    
    var infraSportModel_t = [InfraModel]()
    var infraHotelModel_t = [InfraModel]()
    var infraFoodModel_t = [InfraModel]()
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
                        self.infraSportModel_t = Array(allData[0 ..< (allData.count)])
                        for (sportMenuModel) in self.infraSportModel {
                            if sportMenuModel.sportCode!.name != nil {
                                if !self.infraSportMenu.contains(sportMenuModel.sportCode!.name!) {
                                    self.infraSportMenu.append(sportMenuModel.sportCode!.name!)
                                }
                            }
                        }
                    } catch {
                        print("JSON Decoder Error")
                    }
                    
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
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
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
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
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
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
                        self.infraHotelModel_t = Array(allData[0 ..< (allData.count)])
                        for (hotelMenuModel) in self.infraHotelModel {
                            if !self.infraHotelMenu.contains(hotelMenuModel.name!) {
                                self.infraHotelMenu.append(hotelMenuModel.name!)
                            }
                        }
                        
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
            }
        }.resume()
        
        guard let url17 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=17") else { return }
        
        URLSession.shared.dataTask(with: url17) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraFoodModel = Array(allData[0 ..< (allData.count)])
                        self.infraFoodModel_t = Array(allData[0 ..< (allData.count)])
                        for (foodMenu) in self.infraFoodModel {
                            if foodMenu.name != nil {
                                if !self.infraFoodMenu.contains(foodMenu.name!) {
                                    self.infraFoodMenu.append(foodMenu.name!)
                                }
                            }
                        }
                    } catch {
                        print("JSON Decoder error")
                    }
                }
            }
        }.resume()
    }
    
    
    func isFilter(title: String, category: String) {
        
        switch category {
        case "스포츠시설":
            let test_filter = self.infraSportModel_t.filter { infra in
                return infra.sportCode?.name == title
            }
            if title != "전체" {
                self.infraSportModel.removeAll()
                self.infraSportModel = self.infraSportModel_t.filter { infraModel in
                    return infraModel.sportCode?.name == title
                }
            } else {
                self.infraSportModel.removeAll()
                self.infraSportModel = self.infraSportModel_t
            }
            self.sportMenu = title
            print(test_filter)
            break
        case "숙소":
            let test_filter = self.infraHotelModel_t.filter { infra in
                return infra.name == title
            }
            if title != "전체" {
                self.infraHotelModel.removeAll()
                self.infraHotelModel = self.infraHotelModel_t.filter { infraModel in
                    return infraModel.name == title
                }
            } else {
                self.infraHotelModel.removeAll()
                self.infraHotelModel = self.infraHotelModel_t
            }
            self.hotelMenu = title
            print(test_filter)
            break
        case "맛집":
            let test_filter = self.infraFoodModel_t.filter { infra in
                return infra.name == title
            }
            if title != "전체" {
                self.infraFoodModel.removeAll()
                self.infraFoodModel = self.infraFoodModel_t.filter { infraModel in
                    return infraModel.name == title
                }
            } else {
                self.infraFoodModel.removeAll()
                self.infraFoodModel = self.infraFoodModel_t
            }
            self.foodMenu = title
            print(test_filter)
        default:
            print("Filter Test")
        }
        
        
//        print(test_filter)
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
    
    func set_infra(infraObject: InfraModel) {
        self.infraObject.removeAll()
        self.infraObject.append(infraObject)
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
