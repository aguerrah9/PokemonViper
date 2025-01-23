//
//  ListPresenter.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation

class ListPresenter: AnyPresenter {
    var router: (any AnyRouter)?
    var interactor: (any AnyInteractor)? {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.interactor?.downloadPokemons()
            }
        }
    }
    var view: (any AnyView)?
    
    func interactorDidDowload(results: Result<([Pokemon], PokemonDetail), Error>) {
        switch results {
        case .success(let result):
            if !result.0.isEmpty {
                view?.update(with: result.0)
            }
        case .failure(let error):
            print(error)
            view?.update(with: error)
        }
    }
    
    func viewDidSelect(url: String) {
        router?.presenterDidSendId(url: url)
    }
}
