//
//  FavoriteViewModel.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/16.
//

import SwiftUI

class FavoriteViewModel: ObservableObject {
    @Published var favoriteData = [FavoriteModel]()
    
    init() {
        guard let url = URL(string: "http://www.kbostat.co.kr/resource/search/word/most-favorites") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.sync {
                let allData = try! JSONDecoder().decode([FavoriteModel].self, from: data!)
                self.favoriteData = Array(allData[0 ..< (allData.count)])
//                let favoriteData = Array(allData[0 ..< (allData.count)])
//                print(favoriteData)
            }
        }
        
        task.resume()
    }
}
