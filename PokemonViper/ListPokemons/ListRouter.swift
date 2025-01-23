//
//  ListRouter.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation

class ListRouter: AnyRouter {
    var presenter: (any AnyPresenter)?
    
    func startApp() -> any AnyRouter {
        let listRouter = ListRouter()
        
        
        
        return listRouter
    }
}
