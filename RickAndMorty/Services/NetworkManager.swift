//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Никита Горбунов on 10.06.2022.
//

import Foundation
import Alamofire


class NetworkManager {
    //Singelton
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData(url: String, completion: @escaping (Result<RickAndMorty, Error>) -> Void) {
        AF.request(url)
            .validate()
    }
}
