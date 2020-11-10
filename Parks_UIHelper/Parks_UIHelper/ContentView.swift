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
                .font(.largeTitle)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.6)
        .cornerRadius(10.0)
        .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 6))
    }
}


struct ContentView: View {
    let discover : Discover?
    let url = URL(string: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!
    var body: some View {
//        AsyncImage(url: url
//                    placeholder: Text("Placeholder")
//                    ).aspectRatio(contentMode: .fit)
//            ImageRow(url: "https://i.pinimg.com/originals/b5/1c/d2/b51cd24c04b71bd6f03a4068e366ed5b.jpg")
//                .frame(width: 200, height: 200, alignment: .center)
                //.overlay(ImageOverlay(text: discover?.title))
            
            //Spacer()
        VStack {
               Image("nice-park")
                .resizable()
                .scaledToFit()
                .overlay(ImageOverlay(text: "Nice Park"), alignment: .bottomLeading)
            Text("Looking to expore some new territory? This month's top hikes are recomendations from insiders who knows the parks best")
                .font(.callout)
                .foregroundColor(.white).padding(3)
            List (parks){ park in
                ParkRow(park: park)
                
            }
            Spacer()
            
        }
        .background(Color.black)

    }
}

struct ContentView_Previews: PreviewProvider {
    let discover = Discover(url: "https://i.pinimg.com/originals/b5/1c/d2/b51cd24c04b71bd6f03a4068e366ed5b.jpg", title: "Beautiful View")
    static var previews: some View {
        ContentView(discover: ContentView_Previews().discover)
    }
}
