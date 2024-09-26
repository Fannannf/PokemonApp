//
//  PokemonModel.swift
//  PokemonApp
//
//  Created by MacBook Air on 07/09/24.
//

import Foundation

struct PokemonModel: Codable {
    var count: Int
    var next: String
    var previous: String?
    var results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    var id: Int {
            let urlComponents = url.split(separator: "/")
            return Int(urlComponents[urlComponents.count - 2]) ?? 0
        }
    var name: String
    var url: String
    
    static var pokemon1 = Pokemon(name: "babaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct DetailPokemon: Codable {
    var id: Int
    var height: Int
    var weight: Int
}
