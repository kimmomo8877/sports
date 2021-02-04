//
//  TestView.swift
//  Sports
//
//  Created by TF-Mac-122 on 2021/02/02.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack{
            GeometryReader {geo in
                
                Loader()
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
                
            }
            .background(Color.black.opacity(0.45))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TestButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.blue)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
