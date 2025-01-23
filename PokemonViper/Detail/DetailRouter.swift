//
//  DetailRouter.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 22/01/25.
//

import Foundation
import UIKit

class DetailRouter: AnyRouter {
    var entry: (any UIViewController & AnyView)?
    
    static func startApp(withUrl url: String) -> any AnyRouter {
        let detailRouter = DetailRouter()
        
        let presenter = DetailPresenter()
        presenter.pokemonURL = url
        let interactor = DetailInteractor()
        let view = DetailViewController()
        
        presenter.router = detailRouter
        presenter.interactor = interactor
        presenter.view = view
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        detailRouter.entry = view as (UIViewController & AnyView)?
        
        return detailRouter
    }
    
    func presenterDidSendId(url: String) {
        return
    }
    
}
