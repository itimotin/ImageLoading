//
//  ImageLoader.swift
//  Parks_UIHelper
//
//  Created by itimotin on 11/9/20.
//

import SwiftUI
import Combine
import Foundation
///https://github.com/V8tr/AsyncImage
//The Combine’s way of making a model observable is by conforming to the ObservableObject protocol. In order to bind image updates to a view, we add the @Published property wrapper.
class ImageLoader: ObservableObject {
    @Published var image : UIImage?
    private let  url : URL
    private var cancellable: AnyCancellable?
    
    
    init(url: URL){
        self.url = url
    }
    
    deinit {
        cancel()
    }
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
                        .replaceError(with: nil)
                        .receive(on: DispatchQueue.main)
                        .sink { [weak self] in self?.image = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
