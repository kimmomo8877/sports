//
//  Home.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

struct Team: View {
    @ObservedObject private var vm = VirtualViewModel()
    @State var isModal: Bool = false
    
    var body: some View {
        NavigationView {
            
            ScrollView() {
                VStack {
                    
                    HomeImage(image: "image", width: 100, height: 100)
                    
                    HStack(){
                        
                        NavigationLink(destination: SearchBarView()) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 4)
                            
                            Text("시설이나 팀을 검색해 보세요")
                                //                                .padding(.left, -20)
                                .foregroundColor(.secondary)
                            
                        }.padding(.bottom,10).padding(.top,10).padding(.leading,60).padding(.trailing,50)
                        .overlay(Rectangle().stroke(lineWidth: 0.5))
                        .navigationBarTitle("Navigation", displayMode: .inline)
                        
                    }
                    .padding(10)
                    //                    .background(Color.white)
                    //                    .cornerRadius(20)
                    //                    .overlay(Rectangle()
                    //                                .stroke(lineWidth: 0.5))
                    
                    
                    Text("Some horizontalView1")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.vm.virtualData) { virtual in
                                NavigationLink(destination: Text("dd")) {
                                    ImageCell(imageUrl: virtual.thumbnailUrl, title: "virtual.title")
                                }
                                .navigationBarTitle("TeamView")
                            }
                        }
                    }
                    .frame(height: 100)
                    Text("Some horizontalView2")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.vm.virtualData, id: \.self) { virtual in
                                NavigationLink(destination: Text("dd")) {
                                    ImageCell(imageUrl: virtual.thumbnailUrl, title: "virtual.title")
                                }
                                .navigationBarTitle("TeamView")
                            }
                        }
                    }
                    .frame(height: 100)
                }
            }
        }.navigationBarTitle("Navigation", displayMode: .inline)
    }
}

struct Team_Previews: PreviewProvider {
    static var previews: some View {
        Team()
    }
}


//                        }.padding(10)
//                        .background(Color.white)
//                        .cornerRadius(20)
//                        .overlay(Rectangle().stroke(lineWidth: 0.5))
//                        .sheet(isPresented: $isModal, content:{
//                            SearchBarView()
//                        })
