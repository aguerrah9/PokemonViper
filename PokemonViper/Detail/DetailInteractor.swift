//
//  DetailInteractor.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 22/01/25.
//

import Foundation

class DetailInteractor: AnyInteractor {
    var presenter: (any AnyPresenter)?
    
    func downloadPokemons(withUrl url: String) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDowload(results: .failure(error!))
                return
            }
            do {
                let pokemonDetail = try JSONDecoder().decode(PokemonDetail.self, from: data)
                self?.presenter?.interactorDidDowload(results: .success(
                    ([],pokemonDetail)
                ))
            } catch (let e) {
                self?.presenter?.interactorDidDowload(results: .failure(e))
            }
        }
        task.resume()
    }
    
    func downloadPokemons() {
        return
    }
    
}
