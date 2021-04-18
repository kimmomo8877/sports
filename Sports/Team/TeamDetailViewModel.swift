//
//  TeamDetailViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/04/14.
//

import SwiftUI
import MapKit
class TeamDetailViewModel: ObservableObject {
    
//    @Published var teamModel = [TeamModel]()
//    @Published var teamObject = [TeamModel]()
//    @Published var locations = [MKPointAnnotation]()
    
    @Published var teamNoticeBoardModel = [BoardModel]()
    @Published var teamReservationModel = [ReservationModel]()
    @Published var teamScheduleModel = [ScheduleModel]()
    @Published var teamStoryModel = [BoardModel]()
    
    func setNoticeBoard(teamModel: TeamModel) {
        
        let url_string = "http://www.kbostat.co.kr/resource/board/team/" + String(teamModel.teamNo!) + "/1/content"
        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: encoded!) else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([BoardModel].self, from: data!)
                        self.teamNoticeBoardModel = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("TeamNoticeBoard JSON Decoder Error")
                    }
                }
            }
        }
        .resume()
    }
    
    func setReservationBoard(teamModel: TeamModel) {
        
        let url_string = "http://www.kbostat.co.kr/resource/reservation?teamNos=" + String(teamModel.teamNo!) + "&parentInfraCategoryNo=1&page=0&size=9"
        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: encoded!) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([ReservationModel].self, from: data!)
                        self.teamReservationModel = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("Team Reservation JSON Decoder Error")
                    }
                }
            }
        }
        .resume()
    }
        
    func setTeamSchedule(teamModel: TeamModel) {
        
        let url_string = "http://www.kbostat.co.kr/resource/schedule/team/" + String(teamModel.teamNo!)
        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: encoded!) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([ScheduleModel].self, from: data!)
                        self.teamScheduleModel = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("TeamSchedule JSON Decoder Error")
                    }
                }
            }
        }
        .resume()
    }
    
    func setTeamStory(teamModel: TeamModel) {
        
        let url_string = "http://www.kbostat.co.kr/resource/board/team/" + String(teamModel.teamNo!) + "/34/content"
        let encoded = url_string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: encoded!) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if err != nil {
                print("URL Error")
            } else {
                DispatchQueue.main.async {
                    do {
                        let allData = try JSONDecoder().decode([BoardModel].self, from: data!)
                        self.teamStoryModel = Array(allData[0 ..< (allData.count)])
                    } catch {
                        print("TeamStory JSON Decoder Error")
                    }
                }
            }
        }
        .resume()
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
