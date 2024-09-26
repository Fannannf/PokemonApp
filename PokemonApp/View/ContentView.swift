//
//  ContentView.swift
//  PokemonApp
//
//  Created by MacBook Air on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = PokemonViewModel()
    
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumn) {
                    ForEach(Array(vm.filterPokemon.enumerated()), id: \.offset) {index, pokemon in
                        NavigationLink(
                            destination: PokemonDetailView(pokemon: pokemon)
                        ){
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3), value: vm.filterPokemon.count)
                .navigationTitle("Pokemon List")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }.environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
