//
//  ContentView.swift
//  Parks_UIHelper
//
//  Created by itimotin on 11/9/20.
//

import SwiftUI

struct Discover {
    let url: String?
    let title: String?
}

struct ImageOverlay: View {
    let text: String?
    var body: some View {
        ZStack {
            Text(text!)
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}


struct ContentView: View {
//    let discover : Discover?
    let url = URL(string: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!
    var body: some View {
        AsyncImage(url: url
                    placeholder: Text("Placeholder")
                    ).aspectRatio(contentMode: .fit)
//            ImageRow(url: "https://i.pinimg.com/originals/b5/1c/d2/b51cd24c04b71bd6f03a4068e366ed5b.jpg")
//                .frame(width: 200, height: 200, alignment: .center)
                //.overlay(ImageOverlay(text: discover?.title))
            
            //Spacer()

    }
}

struct ContentView_Previews: PreviewProvider {
    let discover = Discover(url: "https://i.pinimg.com/originals/b5/1c/d2/b51cd24c04b71bd6f03a4068e366ed5b.jpg", title: "Beautiful View")
    static var previews: some View {
        ContentView()
    }
}
