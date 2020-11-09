//
//  ImageRow.swift
//  ParksSwiftUI-Helper
//
//  Created by itimotin on 11/9/20.
///https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/

import SwiftUI
import Combine

struct ImageRow: View {
    let url : String
    var body: some View {
        VStack(alignment: .center) {
            ImageViewContainer(imageUrl: url)
        }
    }
}

struct ImageViewContainer: View {
    @ObservedObject var remoteImageURL: RemoteImageURL

    init(imageUrl: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageUrl)
    }

    var body: some View {
        Image(uiImage: UIImage(data: remoteImageURL.data) ?? UIImage())
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 3.0))
            .frame(width: 70.0, height: 70.0)
    }
}

class RemoteImageURL: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            DispatchQueue.main.async { self.data = data }

            }.resume()
    }
}

struct RemoteImageURL_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

