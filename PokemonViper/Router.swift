//
//  routerProtocol.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation
import UIKit

protocol AnyRouter {
    var entry: (UIViewController & AnyView)? {get}
    
    static func startApp(withUrl url: String) -> AnyRouter
    func presenterDidSendId(url: String)
}
