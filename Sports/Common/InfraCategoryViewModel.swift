//
//  InfraCategoryViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/14.
//

import SwiftUI

class InfraCategoryViewModel: ObservableObject {
    @Published var infraCSportModel = [InfraCategoryModel]()
    @Published var infraCFacilityModel = [InfraCategoryModel]()
    @Published var infraCTravelModel = [InfraCategoryModel]()
    @Published var infraCFestivalModel = [InfraCategoryModel]()
    @Published var infraCHotelModel = [InfraCategoryModel]()
    @Published var infraCFoodModel = [InfraCategoryModel]()
    @Published var infraCTrafficModel = [InfraCategoryModel]()
    
    @Published var infraCSportModel_t = [InfraCategoryModel]()
    @Published var infraCFacilityModel_t = [InfraCategoryModel]()
    @Published var infraCTravelModel_t = [InfraCategoryModel]()
    @Published var infraCFestivalModel_t = [InfraCategoryModel]()
    @Published var infraCHotelModel_t = [InfraCategoryModel]()
    @Published var infraCFoodModel_t = [InfraCategoryModel]()
    @Published var infraCTrafficModel_t = [InfraCategoryModel]()
    
    //http://www.kbostat.co.kr/resource/infra-category/1   스포츠
    //http://www.kbostat.co.kr/resource/infra-category/2   부대시설
    //http://www.kbostat.co.kr/resource/infra-category/3   관광
    //http://www.kbostat.co.kr/resource/infra-category/15  축제
    //http://www.kbostat.co.kr/resource/infra-category/16  숙박
    //http://www.kbostat.co.kr/resource/infra-category/17  food
    //http://www.kbostat.co.kr/resource/infra-category/18  교통
    
    init() {
        guard let url1 = URL(string: "http://www.kbostat.co.kr/resource/infra-category/1") else { return }
        
        URLSession.shared.dataTask(with: url1) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraCategoryModel].self, from: data!)
                        self.infraCSportModel = Array(allData[0 ..< (allData.count)])
                        self.infraCSportModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url2 = URL(string: "http://www.kbostat.co.kr/resource/infra-category/2") else { return }
        
        URLSession.shared.dataTask(with: url2) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraCategoryModel].self, from: data!)
                        self.infraCFacilityModel = Array(allData[0 ..< (allData.count)])
                        self.infraCFacilityModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url3 = URL(string: "http://www.kbostat.co.kr/resource/infra-category/3") else { return }
        
        URLSession.shared.dataTask(with: url3) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraCategoryModel].self, from: data!)
                        self.infraCTravelModel = Array(allData[0 ..< (allData.count)])
                        self.infraCTravelModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url15 = URL(string: "http://www.kbostat.co.kr/resource/infra-category/15") else { return }
        
        URLSession.shared.dataTask(with: url15) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraCategoryModel].self, from: data!)
                        self.infraCFestivalModel = Array(allData[0 ..< (allData.count)])
                        self.infraCFestivalModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url16 = URL(string: "http://www.kbostat.co.kr/resource/infra-category/16") else { return }
        
        URLSession.shared.dataTask(with: url16) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraCategoryModel].self, from: data!)
                        self.infraCHotelModel = Array(allData[0 ..< (allData.count)])
                        self.infraCHotelModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url17 = URL(string: "http://www.kbostat.co.kr/resource/infra-category/17") else { return }
        
        URLSession.shared.dataTask(with: url17) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraCategoryModel].self, from: data!)
                        self.infraCFoodModel = Array(allData[0 ..< (allData.count)])
                        self.infraCFoodModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
        
        guard let url18 = URL(string: "http://www.kbostat.co.kr/resource/infra-category/18") else { return }
        
        URLSession.shared.dataTask(with: url18) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([InfraCategoryModel].self, from: data!)
                        self.infraCTrafficModel = Array(allData[0 ..< (allData.count)])
                        self.infraCTrafficModel_t = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("JSON Decoder Error")
                    }
                }
                //                print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
            }
        }
        .resume()
    }
}
