//
//  DetailViewController.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var pokemon: Pokemon?
    var nameLabel: UILabel = initLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(nameLabel)
        
        nameLabel.text = pokemon?.name
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        nameLabel.frame = CGRect(x: 0, y: 10, width: view.bounds.width, height: 20)
    }
}

func initLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .white
    return label
}
