//
//  NetworkEndpoint.swift
//  CoreModule
//
//  Created by Thang Nguyen on 5/12/24.
//

import Foundation
import Alamofire

public protocol NetworkEndpointProtocol {
    var baseURL: URL {get}
    var path: String {get}
    var method: Alamofire.HTTPMethod {get}
    var parameters: [String: Any]? {get}
    var headers: [String: String]? {get}
    var encoding: ParameterEncoding {get}
    var fullURL: String {get}
}

public extension NetworkEndpointProtocol {
    var encoding: ParameterEncoding {
        JSONEncoding.default
    }
    
    var fullURL: String {
        return baseURL.appendingPathComponent(path).absoluteString
    }
}

