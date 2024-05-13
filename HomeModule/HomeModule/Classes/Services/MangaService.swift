
import Foundation
import CoreModule
import Combine

protocol MangaServiceProtocol {
    func getManga() -> AnyPublisher<MangaResponse, NetworkError>
}

class MangaService: MangaServiceProtocol {
    private let networkService: NetworkServiceProtocol
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getManga() -> AnyPublisher<MangaResponse, NetworkError> {
        networkService.request(endpoint: MangaEndpoint.getManga)
    }
}

