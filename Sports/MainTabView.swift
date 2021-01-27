//
//  Main.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/01/09.
//

import SwiftUI

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
            .tag(Tabs.home)
            .tabItem {
                Text("홈")
            }
    }

    var team: some View {
        TeamView()
            .tag(Tabs.team)
            .tabItem {
                Text("전지훈련팀")
            }
        
    }
    
    var sports: some View {
        Text("SportsView")
            .tag(Tabs.sports)
            .tabItem {
                Text("스포츠재활")
            }
        
    }
    
    var touring: some View {
        TouringView()
            .tag(Tabs.touring)
            .tabItem {
                Text("투어링")
            }
        
    }
    
    var myPage: some View {
        Text("MyPageView")
            .tag(Tabs.myPage)
            .tabItem {
                Text("MY")
            }
        
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

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
