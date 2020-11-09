//
//  AsyncImage.swift
//  Parks_UIHelper
//
//  Created by itimotin on 11/9/20.
//

import SwiftUI

struct AsyncImage<Placeholder : View>: View {
    //We bind AsyncImage to image updates by means of the @StateObject property wrapper. This way, SwiftUI will automatically rebuild the view every time the image changes. We pick @StateObject over @ObservedObject and @EnvironmentObject since we want the view to manage image loader’s lifecycle. SwiftUI automatically keeps image loader alive as long as AsyncImage remains visible, and releases the image loader when the view is not needed anymore.
    @StateObject private var loader: ImageLoader
    private var placeholder: Placeholder
    
    init(url:URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View{
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
    

}
