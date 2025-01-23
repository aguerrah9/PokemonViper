//
//  View.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation

protocol AnyView {
    var presenter: AnyPresenter? {get set}
    
    func update(with pokemons: [Pokemon])
    func update(with pokemon: PokemonDetail)
    func update(with error: Error)
}
