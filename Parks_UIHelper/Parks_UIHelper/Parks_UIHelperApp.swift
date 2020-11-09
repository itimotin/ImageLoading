//
//  Parks_UIHelperApp.swift
//  Parks_UIHelper
//
//  Created by itimotin on 11/9/20.
//

import SwiftUI

@main
struct Parks_UIHelperApp: App {
    var body: some Scene {
        let discover = Discover(url: "https://i.pinimg.com/originals/b5/1c/d2/b51cd24c04b71bd6f03a4068e366ed5b.jpg", title: "Beautiful View")
        WindowGroup {
            ContentView(discover: discover)
        }
    }
}
