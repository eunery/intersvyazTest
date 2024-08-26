//
//  ApiRepository.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Foundation
import Resolver

protocol APIRepositoryProtocol {
    func getAllImages(completionHandler: @escaping (Result<ImageDataModel, APIError>) -> Void)
}

class APIRepository: APIRepositoryProtocol {
    
    // MARK: - Properties
    
    @Injected var apiService: APIServiceProtocol
    
    // MARK: - Methods
    
    func getAllImages(completionHandler: @escaping (Result<ImageDataModel, APIError>) -> Void) {
        apiService.getAllImages { result in
            completionHandler(result)
        }
    }
}
