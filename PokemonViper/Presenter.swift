//
//  presenterProtocol.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidDowload(results: Result<([Pokemon],PokemonDetail),Error>)
    func viewDidSelect(url: String)
}
