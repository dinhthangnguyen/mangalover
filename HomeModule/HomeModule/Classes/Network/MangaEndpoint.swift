
import Foundation
import CoreModule
import Alamofire

enum MangaEndpoint {
    case getManga
}

extension MangaEndpoint: NetworkEndpointProtocol {
    var baseURL: URL {
        guard let url = URL(string: "https://api.jikan.moe/v4/top") else {
            fatalError("not a correct url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getManga:
            return "/manga"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var parameters: [String : Any]? {
        nil
    }
    
    var headers: [String : String]? {
        nil
    }
    
}
