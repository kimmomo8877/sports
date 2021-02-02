//
//  SportView.swift
//  Sports
//
//  Created by Jinsang Jeong on 2021/01/25.
//
import SwiftUI

struct SportView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText = "cc"

    var body: some View {
//        NavigationView {
//        Text("Hello, world!")
//            .padding()
        
        TextField("Search ...", text: $searchText)
    }
//    }
    
}

