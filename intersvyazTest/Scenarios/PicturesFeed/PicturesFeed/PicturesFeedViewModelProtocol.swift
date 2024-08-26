//
//  PicturesFeedViewModelProtocol.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Foundation

protocol PicturesFeedViewModelProtocol {
    
    var dataSource: [ImageModel] { get set }
    func fetchData(completionHandler: @escaping () -> Void)
}
