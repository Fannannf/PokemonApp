//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by MacBook Air on 07/09/24.
//

import Foundation
import SwiftUI

final class PokemonViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetail: DetailPokemon?
    @Published var searchText = ""
    
    var filterPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init(){
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    func getDetailPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon){
            return index + 1
        }
        return 0
    }
    
    func getDetailPokemon(pokemon: Pokemon) {
        let id = getDetailPokemonIndex(pokemon: pokemon)
        pokemonManager.getDetailPokemon(id: id){
            data in DispatchQueue.main.async {
                self.pokemonDetail = data
            }
        }
    }
    
    func formatHW(value: Int) -> String{
        let dvalue = Double(value)
        let string = String(format: "%.2f", dvalue / 10)
        
        return string
    }
}
