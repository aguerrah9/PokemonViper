//
//  ListInteractor.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation

class ListInteractor: AnyInteractor {
    var presenter: (any AnyPresenter)?
    
    func downloadPokemons() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDowload(results: .failure(error!) )
                return
            }
            do {
                let apidata = try JSONDecoder().decode(PokeApi.self, from: data)
                self?.presenter?.interactorDidDowload(results: .success(
                    (apidata.results,PokemonDetail())
                ))
            } catch (let e) {
                self?.presenter?.interactorDidDowload(results: .failure(e))
            }
        }
        task.resume()
    }
    
    func downloadPokemons(withUrl url: String) {
        ()
    }
    
}
