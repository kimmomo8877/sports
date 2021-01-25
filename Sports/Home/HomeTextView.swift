//
//  HomeTextView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/15.
//

import SwiftUI

struct HomeTextView: View {

    @ObservedObject private var infraViewModel = InfraViewModel()
    
    var title: String
    
    var body: some View{
        Button(action:{
            self.infraViewModel.isDisplay(title: title)
        }){
            Text(title)
                .frame(width: CGFloat(title.count) * 20, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(15)
        }
        
    }
}

struct HomeTextView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeTextView(title: "축구하자")
        }
    }
}


//print(title)
//switch title {
//case "전체":
//    infra.isType = "전체"
//    break
//case "축구":
//    infra.isType = "축구"
//    break
//default:
//    print("hi")
//}
