//
//  MangaListViewModel.swift
//  Alamofire
//
//  Created by Thang Nguyen on 5/12/24.
//

import Foundation
import Combine

extension MangaListView {
    class ViewModel: ObservableObject {
        @Published var mangas: [MangaItem] = []
        private let mangaService: MangaServiceProtocol
        private var cancellable: Set<AnyCancellable> = []
        
        init(mangaService: MangaServiceProtocol = MangaService()) {
            self.mangaService = mangaService
        }
        
        func getMangas() {
            mangaService.getManga().sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                default:
                    break
                }
            } receiveValue: { [weak self] response in
                self?.mangas = response.data ?? []
            }.store(in: &cancellable)
        }
    }
}
