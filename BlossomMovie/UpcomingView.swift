//
//  UpcomingView.swift
//  BlossomMovie
//
//  Created by Amulek Angulo on 10/21/25.
//

import SwiftUI

struct UpcomingView: View {
    var body: some View {
        VerticalListView(titles: Title.previewTitles)
    }
}

#Preview {
    UpcomingView()
}
