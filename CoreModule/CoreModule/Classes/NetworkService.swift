//
//  NetworkService.swift
//  CoreModule
//
//  Created by Thang Nguyen on 5/12/24.
//

import Foundation
import Alamofire
import Combine

public protocol NetworkServiceProtocol {
    func request<T: Codable>(endpoint: NetworkEndpointProtocol) -> AnyPublisher<T, NetworkError>
}

public final class NetworkService: NetworkServiceProtocol {
    private var session: Session
    
    public init() {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        configuration.urlCache = nil
        session = Session(configuration: configuration, startRequestsImmediately: true)
    }
    
    private func headers(for endpoint: NetworkEndpointProtocol) -> HTTPHeaders {
        var defaultHeaders = HTTPHeaders.default
        if let header = endpoint.headers {
            header.forEach { (key, value) in
                defaultHeaders[key] = value
            }
        }
        return defaultHeaders
    }
    
    
    public func request<T: Codable>(endpoint: NetworkEndpointProtocol) -> AnyPublisher<T, NetworkError> {
        print("endpoint: " + endpoint.fullURL)
        return session.request(
            endpoint.fullURL,
            method: endpoint.method,
            parameters: endpoint.parameters,
            encoding: endpoint.encoding,
            headers: headers(for: endpoint))
        .publishDecodable(type: T.self)
        .value()
        .mapError { error in
            NetworkError.wrapError(originalError: error)
        }
        .eraseToAnyPublisher()
    }

}
