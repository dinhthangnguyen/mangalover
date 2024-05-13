//
//  MangaListView.swift
//  Alamofire
//
//  Created by Thang Nguyen on 5/12/24.
//

import SwiftUI

public struct MangaListView: View {
    @ObservedObject var viewModel = ViewModel()
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.mangas) { manga in
                    NavigationLink {
                        MangaDetailsView(item: manga)
                    } label: {
                        MangaCell(item: manga)
                    }

                }
            }
            .navigationTitle("Manga List")
        }
        .onAppear {
            viewModel.getMangas()
        }
    }
}

#Preview {
    MangaListView()
}
