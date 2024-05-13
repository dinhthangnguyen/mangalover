//
//  MangaItem.swift
//  HomeModule
//
//  Created by Thang Nguyen on 5/12/24.
//

import Foundation
struct MangaItem : Codable {
    let title : String
    let rank : Int
    let status: String
    let url: String
    let synopsis: String
    let images: Images

    init(title: String) {
        self.title = title
        self.rank = 0
        self.status = ""
        self.url = ""
        self.synopsis = ""
        self.images = .init()
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case rank = "rank"
        case status = "status"
        case url = "url"
        case synopsis = "synopsis"
        case images = "images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        rank = try values.decodeIfPresent(Int.self, forKey: .rank) ?? 0
        status = try values.decodeIfPresent(String.self, forKey: .status) ?? ""
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        synopsis = try values.decodeIfPresent(String.self, forKey: .synopsis) ?? ""
        images = try values.decodeIfPresent(Images.self, forKey: .images) ?? .init()

    }
}

extension MangaItem: Identifiable {
    var id: String {
        title
    }
}

extension MangaItem {
    var imageURL: URL? {
        guard let string = images.jpg?.image_url else {return nil}
        return URL(string: string)
    }
}
