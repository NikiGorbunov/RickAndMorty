//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Никита Горбунов on 10.06.2022.
//

import Alamofire
import AlamofireImage

protocol APIManagerProtocol {
    func sendRequest(url: URL, completion: @escaping(_ characters: [Character]) -> ())
}

class APIManager: APIManagerProtocol {
    private var data: Data?
    
    func sendRequest(url: URL, completion: @escaping ([Character]) -> ()) {
        AF.request(url, method: .get).responseDecodable(of: RickAndMorty.self) { response in
            
            switch response.result {
            case .success(let characters):
                
                var results = [Character]()
                characters.results?.forEach { elements in
                    let character = Character(id: elements.id,
                                              name: elements.name,
                                              status: elements.status,
                                              species: elements.species,
                                              type: elements.type,
                                              gender: elements.gender,
                                              origin: elements.origin,
                                              location: elements.location,
                                              image: elements.image,
                                              episode: elements.episode)
                    results.append(character)
                }
                completion(results)
            case .failure(let error):
                NSLog("\(error)")
            }
        }
    }
    
    
    func getImage(_ url: URL, completion: @escaping (UIImage?) -> Void) {
        AF.request(url, method: .get).responseImage { response in
            switch response.result {
            case .success(let img):
                completion(img)
            case .failure(let error):
                NSLog("\(error)")
            }
        }
    }
}
