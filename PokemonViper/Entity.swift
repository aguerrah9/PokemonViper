//
//  Entity.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation

struct PokeApi: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}

struct PokemonDetail: Decodable {
    var name: String? = ""
    var id: Int? = 0
    var height: Int? = 0
    var weigth: Int? = 0
    var sprites: Sprites?
}

struct Sprites: Decodable {
    var front_default: String = ""
}
