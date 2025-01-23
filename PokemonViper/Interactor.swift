//
//  Interactor.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation

enum TypeError: Error {
    case networkFailed
    case parsingFailed
}

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    
    func downloadPokemons()
    func downloadPokemons(withUrl url: String)
}
