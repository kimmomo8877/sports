//
//  InfraViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/14.
//

import SwiftUI
import MapKit
class InfraViewModel: ObservableObject {
    @Published var infraSportModel = [InfraModel]()
    @Published var infraFacilityModel = [InfraModel]()
    @Published var infraTravelModel = [InfraModel]()
    @Published var infraFestivalModel = [InfraModel]()
    @Published var infraHotelModel = [InfraModel]()
    @Published var infraFoodModel = [InfraModel]()
    @Published var infraModel = [InfraModel]()
    
    @Published var infraSportRModel = [InfraModel]()
    @Published var infraFacilityRModel = [InfraModel]()
    @Published var infraTravelRModel = [InfraModel]()
    @Published var infraFestivalRModel = [InfraModel]()
    @Published var infraHotelRModel = [InfraModel]()
    @Published var infraFoodRModel = [InfraModel]()
    @Published var infraRModel = [InfraModel]()
    
    @Published var infraFacilityDModel = [InfraModel]()
    @Published var infraHotelDModel = [InfraModel]()
    @Published var infraFoodDModel = [InfraModel]()
    @Published var reservationModel = [ReservationModel]()
    
    @Published var infraSportMenu = [String]()
    @Published var sportMenu:String = "전체"
    @Published var sportMenuR:String = "전체"
    @Published var sportCategory:String = "스포츠시설"
    @Published var infraFoodMenu = [String]()
    @Published var foodMenu:String = "전체"
    @Published var foodMenuR:String = "전체"
    @Published var foodCategory:String = "맛집"
    @Published var infraHotelMenu = [String]()
    @Published var hotelMenu:String = "전체"
    @Published var hotelMenuR:String = "전체"
    @Published var hotelCategory:String = "숙소"
    @Published var infraFacilityMenu = [String]()
    @Published var facilityMenu:String = "전체"
    @Published var facilityMenuR:String = "전체"
    @Published var facilityCategory:String = "부대시설"
    @Published var infraTravelMenu = [String]()
    @Published var travelMenuR:String = "전체"
    @Published var travelCategory:String = "여행"
    @Published var infraFestivalMenu = [String]()
    @Published var festivalMenuR:String = "전체"
    @Published var festivalCategory:String = "축제"
    
    @Published var infraObject = [InfraModel]()
    @Published var infraObjects = [InfraModel]()
    
    @Published var locations = [MKPointAnnotation]()
    
    var infraSportModel_t = [InfraModel]()
    var infraHotelModel_t = [InfraModel]()
    var infraFoodModel_t = [InfraModel]()
    var infraFacilityModel_t = [InfraModel]()
    var infraFestivalModel_t = [InfraModel]()
    var infraTravelModel_t = [InfraModel]()
    
    var infraSportRModel_t = [InfraModel]()
    var infraHotelRModel_t = [InfraModel]()
    var infraFoodRModel_t = [InfraModel]()
    var infraFacilityRModel_t = [InfraModel]()
    var infraFestivalRModel_t = [InfraModel]()
    var infraTravelRModel_t = [InfraModel]()
    
    var infraHotelDModel_t = [InfraModel]()
    var infraFoodDModel_t = [InfraModel]()
    var infraFacilityDModel_t = [InfraModel]()
    
    //    @Published var infraSportSoccer = [Infra]()
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=1   스포츠
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=2   부대시설
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=3   관광
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=15  축제
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=16  숙박
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=17  food
    init() {
        guard let url1 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=1") else { return }
        
        URLSession.shared.dataTask(with: url1) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraSportModel = Array(allData[0 ..< (allData.count)])
                        self.infraSportModel_t = Array(allData[0 ..< (allData.count)])
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
                        self.infraFacilityModel_t = Array(allData[0 ..< (allData.count)])
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
                        self.infraTravelModel_t = Array(allData[0 ..< (allData.count)])
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
                        self.infraFestivalModel_t = Array(allData[0 ..< (allData.count)])
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
                    } catch {
                        print("JSON Decoder error")
                    }
                }
            }
        }.resume()
        
        
        guard let url1r = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=1&recommandation=true") else { return }
        
        URLSession.shared.dataTask(with: url1r) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraSportRModel = Array(allData[0 ..< (allData.count)])
                        self.infraSportRModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url2r = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=2&recommandation=true") else { return }
        
        URLSession.shared.dataTask(with: url2r) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraFacilityRModel = Array(allData[0 ..< (allData.count)])
                        self.infraFacilityRModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url3r = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=3&recommandation=true") else { return }
        
        URLSession.shared.dataTask(with: url3r) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraTravelRModel = Array(allData[0 ..< (allData.count)])
                        self.infraTravelRModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url15r = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=15&recommandation=true") else { return }
        
        URLSession.shared.dataTask(with: url15r) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraFestivalRModel = Array(allData[0 ..< (allData.count)])
                        self.infraFestivalRModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
            }
        }
        .resume()
        
        guard let url16r = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=16&recommandation=true") else { return }
        
        URLSession.shared.dataTask(with: url16r) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraHotelRModel = Array(allData[0 ..< (allData.count)])
                        self.infraHotelRModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
            }
        }.resume()
        
        guard let url17r = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=17&recommandation=true") else { return }
        
        URLSession.shared.dataTask(with: url17r) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraFoodRModel = Array(allData[0 ..< (allData.count)])
                        self.infraFoodRModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder error")
                    }
                }
            }
        }.resume()
        
        
        
        guard let url2d = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=2") else { return }
        
        URLSession.shared.dataTask(with: url2d) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraFacilityDModel = Array(allData[0 ..< (allData.count)])
                        self.infraFacilityDModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url16d = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=16") else { return }
        
        URLSession.shared.dataTask(with: url16d) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraHotelDModel = Array(allData[0 ..< (allData.count)])
                        self.infraHotelDModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
            }
        }.resume()
        
        guard let url17d = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=17") else { return }
        
        URLSession.shared.dataTask(with: url17d) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraModel].self, from: data!)
                        self.infraFoodDModel = Array(allData[0 ..< (allData.count)])
                        self.infraFoodDModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder error")
                    }
                }
            }
        }.resume()
        
        guard let url_resv = URL(string: "http://www.kbostat.co.kr/resource/reservation/team/masanuniv") else { return }
        
        URLSession.shared.dataTask(with: url_resv) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([ReservationModel].self, from: data!)
                        self.reservationModel = Array(allData[0 ..< (allData.count)])
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
                return infra.infraCategory?.name == title
            }
            if title != "전체" {
                self.infraSportModel.removeAll()
                self.infraSportModel = self.infraSportModel_t.filter { infraModel in
                    return infraModel.infraCategory?.name == title
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
                return infra.infraCategory?.name == title
            }
            if title != "전체" {
                self.infraHotelModel.removeAll()
                self.infraHotelModel = self.infraHotelModel_t.filter { infraModel in
                    return infraModel.infraCategory?.name == title
                }
            } else {
                self.infraHotelModel.removeAll()
                self.infraHotelModel = self.infraHotelModel_t
            }
            self.hotelMenuR = title
            print(test_filter)
            break
        case "맛집":
            let test_filter = self.infraFoodModel_t.filter { infra in
                return infra.infraCategory?.name == title
            }
            if title != "전체" {
                self.infraFoodModel.removeAll()
                self.infraFoodModel = self.infraFoodModel_t.filter { infraModel in
                    return infraModel.infraCategory?.name == title
                }
            } else {
                self.infraFoodModel.removeAll()
                self.infraFoodModel = self.infraFoodModel_t
            }
            self.foodMenuR = title
            print(test_filter)
        default:
            print("Filter Test")
        }
    }
    
    func isFilterR(title: String, category: String) {
        
        switch category {
        case "추천스포츠시설":
            let test_filter = self.infraSportRModel_t.filter { infra in
                return infra.infraCategory?.name == title
            }
            if title != "전체" {
                self.infraSportRModel.removeAll()
                self.infraSportRModel = self.infraSportRModel_t.filter { infraModel in
                    return infraModel.infraCategory?.name == title
                }
            } else {
                self.infraSportRModel.removeAll()
                self.infraSportRModel = self.infraSportRModel_t
            }
            self.sportMenuR = title
            print(test_filter)
            break
        case "추천숙소":
            let test_filter = self.infraHotelRModel_t.filter { infra in
                return infra.infraCategory?.name == title
            }
            if title != "전체" {
                self.infraHotelRModel.removeAll()
                self.infraHotelRModel = self.infraHotelRModel_t.filter { infraModel in
                    return infraModel.infraCategory?.name == title
                }
            } else {
                self.infraHotelRModel.removeAll()
                self.infraHotelRModel = self.infraHotelRModel_t
            }
            self.hotelMenuR = title
            print(test_filter)
            break
        case "추천맛집":
            let test_filter = self.infraFoodRModel_t.filter { infra in
                return infra.infraCategory?.name == title
            }
            if title != "전체" {
                self.infraFoodRModel.removeAll()
                self.infraFoodRModel = self.infraFoodRModel_t.filter { infraModel in
                    return infraModel.infraCategory?.name == title
                }
            } else {
                self.infraFoodRModel.removeAll()
                self.infraFoodRModel = self.infraFoodRModel_t
            }
            self.foodMenuR = title
            print(test_filter)
        case "추천축제":
            let test_filter = self.infraFestivalRModel_t.filter { infra in
                return infra.infraCategory?.name == title
            }
            if title != "전체" {
                self.infraFestivalRModel.removeAll()
                self.infraFestivalRModel = self.infraFestivalRModel_t.filter { infraModel in
                    return infraModel.infraCategory?.name == title
                }
            } else {
                self.infraFestivalRModel.removeAll()
                self.infraFestivalRModel = self.infraFestivalRModel_t
            }
            self.festivalMenuR = title
            print(test_filter)
        case "추천관광":
            let test_filter = self.infraTravelRModel_t.filter { infra in
                return infra.infraCategory?.name == title
            }
            if title != "전체" {
                self.infraTravelRModel.removeAll()
                self.infraTravelRModel = self.infraTravelRModel_t.filter { infraModel in
                    return infraModel.infraCategory?.name == title
                }
            } else {
                self.infraTravelRModel.removeAll()
                self.infraTravelRModel = self.infraTravelRModel_t
            }
            self.travelMenuR = title
            print(test_filter)
        default:
            print("Filter Test")
        }
    }
    
    func search_infra(searchWord: String) {
        
        let url_string = "http://www.kbostat.co.kr/resource/infra/" + searchWord
        print(url_string)
        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: encoded!) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.sync {
                let allData = try! JSONDecoder().decode(InfraModel.self, from: data!)
                self.infraModel.removeAll()
                self.infraModel.append(allData)
                //Array(allData[0 ..< (allData.count)])
                //                let searchtemp = Array(allData[0 ..< (allData.count)])
                //                print(searchtemp)
            }
        }
        task.resume()
    }
    
    func setInfra(infraObject: InfraModel) {
        self.infraObject.removeAll()
        self.infraObject.append(infraObject)
    }
    
    func setInfras(infraObject: [InfraModel]) {
        self.infraObjects = infraObject
    }
    
    func deleteInfras(infraObject: [InfraModel]) {
        self.infraObjects.removeAll()
    }
    
    func setMap(annotation: MKPointAnnotation) {
        self.locations.removeAll()
        self.locations.append(annotation)
    }
    
    func setMaps(locations: [MKPointAnnotation]) {
        self.locations = locations
    }
    
    func deleteMaps(locations: [MKPointAnnotation]) {
        self.locations.removeAll()
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



//                        for (sportMenuModel) in self.infraSportModel {
//                            if sportMenuModel.sportCode!.name != nil {
//                                if !self.infraSportMenu.contains(sportMenuModel.sportCode!.name!) {
//                                    self.infraSportMenu.append(sportMenuModel.sportCode!.name!)
//                                }
//                            }
//                        }
