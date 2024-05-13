//
//  NetworkError.swift
//  CoreModule
//
//  Created by Thang Nguyen on 5/12/24.
//

import Foundation
public enum NetworkError: Error {
    case unknown
    case wrapError(originalError: Error)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "Something went wrong"
        case let .wrapError(originalError: error):
            return error.localizedDescription
        }
    }
}
