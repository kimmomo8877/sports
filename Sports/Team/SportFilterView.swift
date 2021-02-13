//
//  SportFilterView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/10.
//

import SwiftUI
struct SportFilterView: View {
    @EnvironmentObject var codeViewModel: CodeViewModel

    let columns = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                HStack () {
                    Button(action: {
                        self.codeViewModel.setSportAll()
                    }) {
                        Text("전체선택")
                            .foregroundColor(.secondary)
                    }.padding(.leading, 60)
                    Spacer()
                    
                    Button(action: {
                        self.codeViewModel.setSportNonAll()
                    }) {
                        Text("전체취소")
                            .foregroundColor(.secondary)
                    }.padding(.trailing, 60)
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.codeViewModel.codeSport.indices) { index in
                        
                        HStack () {
                            if  self.codeViewModel.codeSport[index].isCheck == true {
                                Image(systemName: "checkmark.square.fill")
                            }else{
                                Image(systemName: "square")
                            }
                            Text( self.codeViewModel.codeSport[index].name!).padding(.leading, 5)
                            Spacer()
                        }
                        //                .frame(width: geo.size.width / 2, height: 20)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                        .listRowInsets(EdgeInsets())
                        .onTapGesture {
                            if  self.codeViewModel.codeSport[index].isCheck == true {
                                self.codeViewModel.codeSport[index].isCheck = false
                            }
                            else {
                                self.codeViewModel.codeSport[index].isCheck = true
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


//        ScrollView () {
//
//            ForEach(self.codeViewModel.codeSport.indices) { index in
//
//                HStack () {
//                    if  self.codeViewModel.codeSport[index].isCheck == true {
//                        Image(systemName: "checkmark.square.fill")
//                    }else{
//                        Image(systemName: "square")
//                    }
//                    Text( self.codeViewModel.codeSport[index].name!).padding(.leading, 5)
//                    Spacer()
//                }
////                .frame(width: geo.size.width / 2, height: 20)
//                .padding(.vertical, 5)
//                .padding(.horizontal)
//                .listRowInsets(EdgeInsets())
//                .onTapGesture {
//                    if  self.codeViewModel.codeSport[index].isCheck == true {
//                        self.codeViewModel.codeSport[index].isCheck = false
//                    }
//                    else {
//                        self.codeViewModel.codeSport[index].isCheck = true
//                    }
//                }
//            }
//
//        }


//HStack () {
//    if codeSport.isCheck == true {
//        Image(systemName: "checkmark.square.fill")
//    }else{
//        Image(systemName: "square")
//    }
//    Text(codeSport.name!).padding(.leading, 5)
//}.padding(.vertical, 5)
//.padding(.horizontal)
//.listRowInsets(EdgeInsets())
//.onTapGesture {
//    if codeSport.isCheck == true {
//        self.codeViewModel.codeSport[i].isCheck = false
//    }
//    else {
//        self.codeViewModel.codeSport[i].isCheck = true
//    }
//}


//    HStack() {
//
////                    CheckBox(isChecked: false, appearance: style) {
////                      Text("").font(.largeTitle).padding().foregroundColor(.yellow).lineLimit(10)
////                    }
//        CheckBox(isChecked:(codeSport.isCheck) ?? false,appearance: style, onCheck:{_ in
//            codeSport.isCheck; in
//            print(codeSport.isCheck)
////                        codeSport.isCheck = true
//        }) {v
//            Text(codeSport.name!).font(.body).padding()
//        }
////                    Text(codeSport.name!)
//        //                        Text(codeSport.name!)
//        //                        Text(codeSport.name!)
//        Spacer()
//    }
//}
//}
////        }
////        .frame(height: 10)
////        .padding(7)



//.onTapGesture {
//                        if self.selectedPlatforms.contains(platform.id) {
//                            self.selectedPlatforms.removeAll(where: { $0 == platform.id })
//                        }
//                        else {
//                            self.selectedPlatforms.append(platform.id)
//                        }
//                }
