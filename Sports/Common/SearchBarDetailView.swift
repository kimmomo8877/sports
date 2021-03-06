

import SwiftUI

struct SearchBarDetailView: View {
    
    @Binding var text: String
    @State private var isEditing = false
    @State private var isShowing = false
    @EnvironmentObject var searchViewModel : SearchViewModel
    
    var body: some View {
        HStack {

            TextField("Search ...", text: $text)
                
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                self.isEditing = false
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                
                NavigationLink(destination: SearchResultView(), isActive: $isShowing) {
                    Button(action: {
                        
                        // Dismiss the keyboard
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

                        searchViewModel.searchInfra(searchWord: self.text)
                        searchViewModel.searchTeam(searchWord: self.text)
                        self.isShowing = true
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }.navigationBarTitle("검색", displayMode: .inline)
                
            }
        }
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(text: .constant(""))
//    }
//}


//                Button(action: {
////                    self.isEditing = false
////                                        self.text = ""
//
//                    // Dismiss the keyboard
//                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//
//                    searchModel.call_json(searchWord: self.text)
//
//
//                }) {
//                    Text("검색")
//                }
//                .padding(.trailing, 10)
//                .transition(.move(edge: .trailing))
//                .animation(.default)
