//
//  ImageModel.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 27.08.2024.
//

import Foundation

struct ImageDataModel: Codable {
    let images: [ImageModel]
}

struct ImageModel: Codable {
    let name: String
    let image: String
}
