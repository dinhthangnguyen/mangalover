
import Foundation
struct MangaResponse : Codable {
    let data : [MangaItem]?
    
    init(data: [MangaItem]) {
        self.data = data
    }

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([MangaItem].self, forKey: .data)
    }
}
