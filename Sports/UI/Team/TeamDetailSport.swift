//
//  TeamDetailSport.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/23.
//

//
//  Home.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

struct TeamDetailSport: View {
    //    @ObservedObject private var infra = InfraViewModel()
    @State private var showingSheet = true
    
    var body: some View {
        
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                Image("image")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                Image("image")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                Image("image")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                Image("image")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                Image("image")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                
                
                //                ForEach(self.infra.infraSport, id: \.self) { infraSport in
                //
                //                    NavigationLink(destination: Text(verbatim: "dd")) {
                //                        ForEach(infraSport.attachFiles!, id: \.self) {
                //                            infra in
                //                            ImageCell(imageUrl: "http://www.kbostat.co.kr/resource/static-file" + infra.saveFilePath!, title: "")
                //                        }
                //                    }
                //                    .navigationBarTitle("HomeView")
                //
                //
                //                }
            }
        }
        .frame(height: 150)
        .padding(5)
        
        Button(action:{
            //        self.infra.isDisplay(title: title)
        }){
            Text("sheet")
        }.actionSheet(isPresented: $showingSheet) {
            ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
            
        }
    }
    
}
