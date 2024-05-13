//
//  ContentView.swift
//  MangaLover
//
//  Created by Thang Nguyen on 5/12/24.
//

import SwiftUI
import HomeModule

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                MangaListView()
            } label: {
                Text("Start")
            }
        }
    }
}

#Preview {
    ContentView()
}
