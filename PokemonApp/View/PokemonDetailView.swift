//
//  PokemonDetail.swift
//  PokemonApp
//
//  Created by MacBook Air on 08/09/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: PokemonViewModel
    let pokemon: Pokemon
    var body: some View {
        VStack{
            VStack(spacing: 10){
                PokemonView(pokemon: pokemon)
                Text("**ID** \(vm.pokemonDetail?.id ?? 0)")
                Text("**Height** \(vm.formatHW(value: vm.pokemonDetail?.height ?? 0)) KG")
                Text("**Weight** \(vm.formatHW(value: vm.pokemonDetail?.weight ?? 0)) KG")
            }
        }.onAppear{
            vm.getDetailPokemon(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.pokemon1).environmentObject(PokemonViewModel())
}
