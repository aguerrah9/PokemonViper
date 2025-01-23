//
//  DetailPresenter.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 22/01/25.
//

import Foundation

class DetailPresenter: AnyPresenter {
    var router: (any AnyRouter)?
    var interactor: (any AnyInteractor)? {
        didSet {
            self.interactor?.downloadPokemons(withUrl: self.pokemonURL ?? "")
        }
    }
    var view: (any AnyView)?
    
    var pokemonURL: String?
    
    func interactorDidDowload(results: Result<([Pokemon],PokemonDetail), any Error>) {
        switch results {
        case .success(let result):
            if result.0.isEmpty {
                view?.update(with: result.1)
            }
        case .failure(let error):
            view?.update(with: error)
        }
    }
    
    func viewDidSelect(url: String) {
        return
    }
    
}
