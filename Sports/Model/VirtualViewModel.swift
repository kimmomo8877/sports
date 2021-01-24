//
//  VirtualViewModel.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

class VirtualViewModel: ObservableObject {
    @Published var virtualData = [VirtualModel]()
    
    init() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                let allData = try! JSONDecoder().decode([VirtualModel].self, from: data!)
                self.virtualData = Array(allData[0 ..< 10])
            }
        }
        .resume()
    }
}
