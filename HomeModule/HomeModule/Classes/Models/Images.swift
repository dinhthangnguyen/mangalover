
import Foundation
struct Images : Codable {
	let jpg : Jpg?

	enum CodingKeys: String, CodingKey {
		case jpg = "jpg"
	}
    
    init () {
        jpg = nil
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		jpg = try values.decodeIfPresent(Jpg.self, forKey: .jpg)
	}

}
