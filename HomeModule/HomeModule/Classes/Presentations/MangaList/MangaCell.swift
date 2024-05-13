//
//  MangaCell.swift
//  Alamofire
//
//  Created by Thang Nguyen on 5/12/24.
//

import SwiftUI

struct MangaCell: View {
    var item: MangaItem

    var body: some View {
        VStack (alignment: .leading){
            Text(item.title)
                .font(.headline)
            Text("\(item.rank)")
        }
    }
}

