//
//  ReservationView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/10.
//

import SwiftUI

struct ReservationView: View {
    @EnvironmentObject var infraViewModel:InfraViewModel
    
    var body: some View {
        
        VStack() {
            HStack {
                if infraViewModel.infraObject[0].attachFiles!.count > 0 {
                    ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infraViewModel.infraObject[0].attachFiles![0].saveFilePath!, title: "", width: 50, height: 50)
                } else {
                    Image("search_default_image")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                VStack {
                    Text("\(infraViewModel.infraObject[0].name ?? "")")
                    Text("\(infraViewModel.infraObject[0].address ?? "")").foregroundColor(.secondary)
                        .font(Font.system(size:15))
                }
            }.padding(.leading, 10)
            Spacer()
        }
    }
}
