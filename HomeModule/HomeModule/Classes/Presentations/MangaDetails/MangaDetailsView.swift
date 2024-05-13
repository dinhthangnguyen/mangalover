//
//  MangaDetailsView.swift
//  Alamofire
//
//  Created by Thang Nguyen on 5/12/24.
//

import SwiftUI

struct MangaDetailsView: View {
    var item: MangaItem
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: item.imageURL) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                    
                } placeholder: {
                    ProgressView()
                }
                Text(item.title).font(.title)
                Text(item.status).foregroundStyle(.red)
                Text(item.url).foregroundStyle(.blue)
                Text(item.synopsis)
            }
        }
    }
}
