//
//  ApiSettings.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Foundation

enum APIMethods: String {
    case get = "GET"
    case post = "POST"
}

enum Endpoints: String {
    case mainScreen = "/eunery/imagesBack/db"
}

enum APIError: Error, LocalizedError {
    case badURL
    case badResponse(statusCode: Int)
    case emptyResponse
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
        
    var errorDescription: String? {
        
        switch self {
        case .badURL:
            return "Invalid url. Check credentials."
        case .parsing:
            return "Parsing error. Check Models."
        case .unknown:
            return "Unknown error."
        case .badResponse(let statusCode):
            return "Bad Response. Status code: \(statusCode)"
        case .emptyResponse:
            return "Empty response."
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong"
        }
    }
}
