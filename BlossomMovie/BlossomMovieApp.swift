//
//  BlossomMovieApp.swift
//  BlossomMovie
//
//  Created by Amulek Angulo on 10/20/25.
//

import SwiftUI
import SwiftData

@main
struct BlossomMovieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Title.self)
    }
}
