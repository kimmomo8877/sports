//
//  RegionFilterView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/02/13.
//

import SwiftUI
struct RegionFilterView: View {
    @EnvironmentObject var codeViewModel: CodeViewModel

    let columns = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                HStack () {
                    Button(action: {
                        self.codeViewModel.setRegionAll()
                    }) {
                        Text("전체선택")
                            .foregroundColor(.secondary)
                    }.padding(.leading, 60)
                    Spacer()
                    
                    Button(action: {
                        self.codeViewModel.setRegionNonAll()
                    }) {
                        Text("전체취소")
                            .foregroundColor(.secondary)
                    }.padding(.trailing, 60)
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.codeViewModel.codeRegion.indices) { index in
                        
                        HStack () {
                            if  self.codeViewModel.codeRegion[index].isCheck == true {
                                Image(systemName: "checkmark.square.fill")
                            }else{
                                Image(systemName: "square")
                            }
                            Text( self.codeViewModel.codeRegion[index].name!).padding(.leading, 5)
                            Spacer()
                        }
                        //                .frame(width: geo.size.width / 2, height: 20)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                        .listRowInsets(EdgeInsets())
                        .onTapGesture {
                            if  self.codeViewModel.codeRegion[index].isCheck == true {
                                self.codeViewModel.codeRegion[index].isCheck = false
                            }
                            else {
                                self.codeViewModel.codeRegion[index].isCheck = true
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
