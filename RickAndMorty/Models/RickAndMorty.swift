//
//  RickAndMorty.swift
//  RickAndMorty
//
//  Created by Никита Горбунов on 10.06.2022.
//

import Foundation

struct RickAndMorty: Decodable {
    let info: Info?
    let results: [Character]?
}

struct Info: Decodable {
    let pages: Int?
    let next: String?
    let prev: String?
}

struct Character: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin: Location?
    let location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    
    init(characterData: [String:Any]) {
        self.id = characterData["id"] as? Int
        self.name = characterData["name"] as? String
        self.status = characterData["status"] as? String
        self.species = characterData["species"] as? String
        self.gender = characterData["gender"] as? String
        self.origin = characterData["origin"] as? Location
        self.location = characterData["location"] as? Location
        self.image = characterData["image"] as? String
        self.episode = characterData["episode"] as? [String]
        self.url = characterData["url"] as? String
    }
        
    static func getCharacters(from data: Any) -> [Character] {
        guard let rickData = data as? [String: Any] else { return [] }
        guard let results = rickData["results"] as? [[String: Any]] else { return [] }
        
        var characters = [Character]()
        
        for result in results {
            let character = Character(characterData: result)
            characters.append(character)
        }
        return characters
    }
}

struct Location: Decodable {
    let name: String?
}

enum Link: String {
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character"
}


