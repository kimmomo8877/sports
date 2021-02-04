//
//  SearchView.swift
//  BASIS_VIEW (iOS)
//
//  Created by Hyungwoo Moon on 2020/12/20.
//

import SwiftUI

struct SearchBarView: View  {
    
    @EnvironmentObject var favoriteViewModel : FavoriteViewModel
    @State private var searchText = ""
    var body: some View {
        
        VStack {
            
            SearchBarDetailView(text: $searchText)
                .padding(.top, 10)
            
            List(self.favoriteViewModel.favoriteModel.filter({ searchText.isEmpty ? true : $0.searchWord!.contains(searchText) }),id: \.self) { item in
                
                Button(action: {
                    self.searchText = item.searchWord!
                }) {
                    Text(item.searchWord!)
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
