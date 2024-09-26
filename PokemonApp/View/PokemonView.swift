//
//  PokemonView.swift
//  PokemonApp
//
//  Created by MacBook Air on 08/09/24.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: PokemonViewModel
    let pokemon: Pokemon
    let dimension: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeApi/sprites/master/sprites/pokemon/\(vm.getDetailPokemonIndex(pokemon: pokemon)).png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimension, height: dimension)
                } else {
                    ProgressView()
                        .frame(width: dimension, height: dimension)
                }
            }.background(.thinMaterial)
            .clipShape(Circle())
            .padding(.bottom, 10)
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .bold, design: .default))
                .padding(.bottom, 20)
        }
    }
}

#Preview {
    PokemonView(pokemon: Pokemon.pokemon1).environmentObject(PokemonViewModel())
}
