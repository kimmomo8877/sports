//
//  Home.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

struct Home: View {
    @ObservedObject private var vm = VirtualViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView() {
                VStack {
//                    HomeImage(image: "image", width: 100, height: 100)
                    
                    ScrollView(.horizontal) {
                        HStack(){
                            
                        }.padding(10)
                        .cornerRadius(10)
                    }
                    
                    Text("Some horizontalView1")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.vm.virtualData) { virtual in
                                NavigationLink(destination: Text("dd")) {
                                    ImageCell(imageUrl: virtual.thumbnailUrl, title: "virtual.title")
                                }
                                .navigationBarTitle("HomeView")
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
                                .navigationBarTitle("HomeView")
                            }
                        }
                    }
                    .frame(height: 100)
                    
                    Text("InfraCategory")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {

                        }
                    }
                    .frame(height: 100)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
