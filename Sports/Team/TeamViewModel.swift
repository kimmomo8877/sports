//
//  InfraViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/14.
//

import SwiftUI
import MapKit
class TeamViewModel: ObservableObject {
    
    @Published var teamModel = [TeamModel]()
    @Published var teamObject = [TeamModel]()
    @Published var locations = [MKPointAnnotation]()
    
    init() {
        
    }
    
    func searchTeam(searchWord: String) {
        
        let url_string = "http://www.kbostat.co.kr/resource/team/" + searchWord
        print(url_string)
        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: encoded!) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.sync {
                let allData = try! JSONDecoder().decode(TeamModel.self, from: data!)
                self.teamModel.removeAll()
                self.teamModel.append(allData)
            }
        }
        task.resume()
    }
    
    func setTeam(teamObject: TeamModel) {
        self.teamObject.removeAll()
        self.teamObject.append(teamObject)
    }
    
    func setMap(annotation: MKPointAnnotation) {
        self.locations.append(annotation)
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
