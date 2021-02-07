//
//  Main.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

//struct MainTabView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @State private var searchText = "cc"
//
//    var body: some View {
//        NavigationView {
////        Text("Hello, world!")
////            .padding()
//
//        TextField("Search ...", text: $searchText)
//    }
//    }
//
//}

struct MainTabView: View {
    private enum Tabs {
        case home, team, sports, touring, myPage
    }
    
    @State private var selectedTab: Tabs = .home
    //    private var testViewModel = TestViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                home
                team
                sports
                touring
                myPage
            }
            .accentColor(.primary)
        }
        .edgesIgnoringSafeArea(.top)
        .addPartialSheet()
    }
}

private extension MainTabView {
    var home: some View {
        //        Tracker()
        //            .tag(Tabs.team)
        //            .tabItem {
        //                Text("전지훈련팀")
        //            }
        HomeView()
            //        SportView()
            .tag(Tabs.home)
            .tabItem {
                VStack() {
                    Image(systemName: "house.fill")
                    Text("홈").font(Font.system(size:15))
                }
            }
    }
    
    var team: some View {
        TeamView()
            //        SportView()
            //        Text("MyPageView")
            .tag(Tabs.team)
            .tabItem {
                VStack() {
                    Image(systemName: "calendar.circle.fill")
                    Text("전지훈련팀").font(Font.system(size:15))
                }
            }
        
    }
    
    var sports: some View {
        SportView()
            //        Text("MyPageView")
            .tag(Tabs.sports)
            .tabItem {
                VStack() {
                    Image(systemName: "sportscourt.fill")
                    Text("스포츠재활").font(Font.system(size:15))
                }
            }
        
    }
    
    var touring: some View {
        TouringView()
            //        Text("MyPageView")
            .tag(Tabs.touring)
            .tabItem {
                VStack() {
                    Image(systemName: "airplane.circle.fill")
                    Text("투어링").font(Font.system(size:15))
                }
            }
        
    }
    
    var myPage: some View {
        MyView()
            .tag(Tabs.myPage)
            .tabItem {
                VStack() {
                    Image(systemName: "person.crop.circle.fill")
                    Text("MY").font(Font.system(size:15))
                }
            }
        
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}





//fileprivate extension View {
//  func tabItem(image: String, text: String) -> some View {
//    self.tabItem {
//      Symbol(image, scale: .large)
//        .font(Font.system(size: 17, weight: .light))
//      Text(text)
//    }
//  }
//}
