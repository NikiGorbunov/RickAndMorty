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
    let count: Int?
    let pages: Int?
    let prev: String?
    let next: String?
}

struct Character: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Location?
    let location: Location?
    let image: String?
    let episode: [String]?
}

struct Location: Decodable {
    let name: String?
    let url: String?
}


