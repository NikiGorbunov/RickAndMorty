//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Никита Горбунов on 10.06.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

class NetworkManager {
    //Singelton
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData(url: String, completion: @escaping (Result<RickAndMorty, NetworkManager>) -> Void) {
        AF.request(url)
            .validate()
    }
}
