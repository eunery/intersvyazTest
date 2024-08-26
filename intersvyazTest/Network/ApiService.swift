//
//  ApiService.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Foundation
import Resolver

protocol APIServiceProtocol {
    func getAllImages(completionHandler: @escaping (Result<ImageDataModel, APIError>) -> Void)
}

struct APIService: APIServiceProtocol {
    
    // MARK: - Properties
    
    @Injected var worker: NetworkWorkerProtocol
    
    // MARK: - Methods
    
    func getAllImages(completionHandler: @escaping (Result<ImageDataModel, APIError>) -> Void) {
        worker.performRequest(
            queryParametres: nil,
            endpoint: Endpoints.mainScreen.rawValue,
            apiMethod: .get,
            responseType: ImageDataModel.self,
            completionHandler: completionHandler
        )
    }
    
}
