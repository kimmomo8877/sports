//
//  InfraCategoryViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/14.
//

import SwiftUI

class InfraCategoryViewModel: ObservableObject {
    @Published var infraCategoryData = [InfraCategory]()
    
    init() {
        guard let url = URL(string: "http://www.kbostat.co.kr/resource/infra-category") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                let allData = try! JSONDecoder().decode([InfraCategory].self, from: data!)
                self.infraCategoryData = Array(allData[0 ..< (allData.count-1)])
            }
        }
        .resume()
    }
}


//        ForEach(self.infraCategoryData, id: \.self) {
//            infraData in
//            Text("\(infra.name ?? "")")
//        }

//                ForEach(allData, id: \.self) { subData in
//                    let infraCategoryNo = subData.infraCategoryNo ?? 0
//                }
                
//                for (subData): ( InfraCategory) in allData {
////                    print("index: \(index), subJson : \(subJson)")
//
//                    let infraCategoryNo = subData.infraCategoryNo ?? 0
//                    let parentInfraCategoryNo = subData.parentInfraCategoryNo ?? 0
//                    let parentInfraCategory = subData.parentInfraCategory ?? ""
//                    let name = subData.name ?? ""
//                    let iconClassName = subData.iconClassName ?? ""
//
//                    let infraCategory = InfraCategory(infraCategoryNo: infraCategoryNo, parentInfraCategoryNo: parentInfraCategoryNo, parentInfraCategory: parentInfraCategory, name: name, iconClassName:iconClassName)
//                    self.infraCategoryData.append(infraCategory)
//                }
