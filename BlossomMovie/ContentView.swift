//
//  ContentView.swift
//  BlossomMovie
//
//  Created by Amulek Angulo on 10/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab(Constants.homeString, systemImage: Constants.homeIconString) {
                HomeView()
            }
            Tab(Constants.upcomingString, systemImage: Constants.upcomingIconString) {
                UpcomingView()
            }
            Tab(Constants.searchString, systemImage: Constants.searchIconString) {
                Text(Constants.searchString)
            }
            Tab(Constants.downloadingString, systemImage: Constants.downloadIconString) {
                Text(Constants.downloadingString)
            }
        }

    }
}

#Preview {
    ContentView()
}
