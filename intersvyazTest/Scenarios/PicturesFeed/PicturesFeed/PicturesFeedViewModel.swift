//
//  PicturesFeedViewModel.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Foundation
import Resolver

final class PicturesFeedViewModel: PicturesFeedViewModelProtocol {
    
    // MARK: - Properties
    
    @Injected var apiRepository: APIRepositoryProtocol
    var dataSource: [ImageModel] = []
    
    // MARK: - Methods
    
    func fetchData(completionHandler: @escaping () -> Void) {
        apiRepository.getAllImages { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                self.dataSource = response.images
                completionHandler()
            case .failure(let error):
                print(error)
                completionHandler()
            }
        }
    }
}
