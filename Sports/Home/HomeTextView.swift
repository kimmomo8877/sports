//
//  HomeTextView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/15.
//

import SwiftUI

struct HomeTextView: View {
    
    @EnvironmentObject var infraViewModel: InfraViewModel
//    @State var selectedTitle = "전체"
//    @State var selectedCategory = ""
    var title: String
    var category: String
    
    var body: some View{
        Button(action:{
            if category.prefix(2) == "추천" {
              self.infraViewModel.isFilterR(title: title, category: category)
            } else {
                self.infraViewModel.isFilter(title: title, category: category)
            }
        }){
            
//            let menu_t = self.selectedTitle
//            if ( title ==  menu_t && category == "스포츠시설" ){
//            let testt = self.infraViewModel.sportMenu
            if ( title ==  self.infraViewModel.sportMenu  && category == "추천스포츠시설")
                || ( title ==  self.infraViewModel.hotelMenu && category == "추천숙소")
                || ( title ==  self.infraViewModel.foodMenu && category == "추천맛집" )
                || ( title ==  self.infraViewModel.sportMenu && category == "스포츠시설" )
                || ( title ==  self.infraViewModel.facilityMenu && category == "부대시설" ){
                Text(title)
                    .frame(width: CGFloat(title.count) * 20, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(5)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(15)
            } else {
                Text(title)
                    .frame(width: CGFloat(title.count) * 20, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(5)
            }
        }
    }
}


//                .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.black, lineWidth: 0.1) )
//                .foregroundColor(Color.white)
//                .background(Color.black)
//                .cornerRadius(15)

//                .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.black, lineWidth: 0.1) )

//struct HomeTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            HomeTextView(title: "축구하자")
//        }
//    }
//}


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

//            switch category {
//            case "스포츠시설":
////                self.selectedTitle = self.infraViewModel.sportMenu
////                self.selectedCategory = "스포츠시설"
//                break
//            case "숙소":
////                self.selectedTitle = self.infraViewModel.hotelMenu
////                self.selectedCategory = "숙소"
//                break
//            case "맛집":
////                self.selectedTitle = self.infraViewModel.foodMenu
////                self.selectedCategory = "맛집"
//            default:
//                print("Menu Selected")
//            }
            
