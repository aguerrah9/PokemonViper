//
//  ListRouter.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation
import UIKit

class ListRouter: AnyRouter {
    var entry: (any UIViewController & AnyView)?
    
    static func startApp(withUrl url: String = "") -> any AnyRouter {
        let listRouter = ListRouter()
        
        let listPresenter = ListPresenter()
        let listInteractor = ListInteractor()
        let listView = ListViewController()
        
        listPresenter.router = listRouter
        listPresenter.interactor = listInteractor
        listPresenter.view = listView
        
        listInteractor.presenter = listPresenter
        listView.presenter = listPresenter
        
        listRouter.entry = listView as (UIViewController & AnyView)?
        
        return listRouter
    }
    
    func presenterDidSendId(url: String) {
        let detailRouter = DetailRouter.startApp(withUrl: url)
        self.entry!.present(detailRouter.entry!, animated: true)
    }
    
}
