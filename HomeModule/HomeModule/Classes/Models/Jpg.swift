

import Foundation
struct Jpg : Codable {
	let image_url : String?
	let small_image_url : String?
	let large_image_url : String?

	enum CodingKeys: String, CodingKey {

		case image_url = "image_url"
		case small_image_url = "small_image_url"
		case large_image_url = "large_image_url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		small_image_url = try values.decodeIfPresent(String.self, forKey: .small_image_url)
		large_image_url = try values.decodeIfPresent(String.self, forKey: .large_image_url)
	}

}
