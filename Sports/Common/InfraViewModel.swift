//
//  InfraViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/14.
//

import SwiftUI

class InfraViewModel: ObservableObject {
    @Published var infraSportModel = [InfraModel]()
    @Published var infraHotelModel = [InfraModel]()
    @Published var infraFoodModel = [InfraModel]()
    var infraSport_temp = [InfraModel]()
//    @Published var infraSportSoccer = [Infra]()
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=1   sport
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=16  hotel
    //http://www.kbostat.co.kr/resource/infra?parentInfraCategory=17  food
    init() {
        
        guard let url1 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=1") else { return }
        
//        1번 스포츠 카타로그
//        2번 카타로그별 json 호출
//        3번 개별 호출 전부 합침,
//        "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=1?sportId='1000'
        
        URLSession.shared.dataTask(with: url1) { (data, resp, err) in
            DispatchQueue.main.async {
                let allData = try! JSONDecoder().decode([InfraModel].self, from: data!)
                self.infraSportModel = Array(allData[0 ..< (allData.count-1)])
//                self.infraSport_temp = Array(allData[0 ..< (allData.count)])
                
            }
        }
        .resume()
        
        guard let url16 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=16") else { return }
        
        URLSession.shared.dataTask(with: url16) { (data, resp, err) in
            DispatchQueue.main.async {
                let allData = try! JSONDecoder().decode([InfraModel].self, from: data!)
                self.infraHotelModel = Array(allData[0 ..< (allData.count)])
            }
        }
        .resume()
        
        guard let url17 = URL(string: "http://www.kbostat.co.kr/resource/infra?parentInfraCategory=17") else { return }
        
        URLSession.shared.dataTask(with: url17) { (data, resp, err) in
            DispatchQueue.main.async {
                let allData = try! JSONDecoder().decode([InfraModel].self, from: data!)
                self.infraFoodModel = Array(allData[0 ..< (allData.count)])
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
    }
}

//ForEach(self.infraSport, id: \.self) { infra in
//    if infra.sportCode != nil {
//      infra.sportCode!.isDisplay = true
////                infra.sportCode!
//    }
//}
