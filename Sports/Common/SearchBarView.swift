//
//  SearchView.swift
//  BASIS_VIEW (iOS)
//
//  Created by Hyungwoo Moon on 2020/12/20.
//

import SwiftUI



struct SearchBarView: View  {
    
    @EnvironmentObject var favoriteViewModel : FavoriteViewModel
//    @ObservedObject private var favoriteViewModel = FavoriteViewModel()
//    @ObservedObject private var searchModel = SearchViewModel()
    @State private var searchText = ""
    var body: some View {
        
//        ZStack {

            VStack {
                
//                SearchBar(text: $searchText, searchModel: searchModel)
//                SearchBarDetailView(text: $searchText)
//                    .padding(.top, 10)
                SearchBarDetailView(text: $searchText)
                    .padding(.top, 10)
                
     
                List(self.favoriteViewModel.favoriteModel.filter({ searchText.isEmpty ? true : $0.searchWord!.contains(searchText) }),id: \.self) { item in
//                    Text(item.searchWord!)
            
                    
                    Button(action: {
                                           // Save the object into a global store to be used later on
                                           self.searchText = item.searchWord!
                                           // Present new view
//                                           self.link.presented?.value = true
                                       }) {
                                           Text(item.searchWord!)
                                       }
                    
//                                        NavigationLink(destination: TeamSearch(searchWord:item.searchWord!)) {
//                                            Text(item.searchWord!)
//                                        }
//                }
            }
        }
    }

}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
