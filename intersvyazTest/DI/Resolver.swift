//
//  Resolver.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { NetworkWorker() }
            .implements(NetworkWorkerProtocol.self)
        register { APIService() }
            .implements(APIServiceProtocol.self)
        register { APIRepository() }
            .implements(APIRepositoryProtocol.self)
        
        register { PicturesFeedViewModel() }
            .implements(PicturesFeedViewModelProtocol.self)
    }
}
