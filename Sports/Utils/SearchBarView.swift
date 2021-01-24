//
//  SearchView.swift
//  BASIS_VIEW (iOS)
//
//  Created by Hyungwoo Moon on 2020/12/20.
//

import SwiftUI



struct SearchBarView: View  {
    
    @ObservedObject private var favorite = FavoriteViewModel()
//    @ObservedObject private var searchModel = SearchViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
//                SearchBar(text: $searchText, searchModel: searchModel)
                SearchBar(text: $searchText)
                    .padding(.top, 0)
     
                List(self.favorite.favoriteData.filter({ searchText.isEmpty ? true : $0.searchWord!.contains(searchText) }),id: \.self) { item in
                    Text(item.searchWord!)
//                                        NavigationLink(destination: TeamSearch(searchWord:item.searchWord!)) {
//                                            Text(item.searchWord!)
//                                        }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
