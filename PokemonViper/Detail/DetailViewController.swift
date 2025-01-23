//
//  DetailViewController.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, AnyView {
    var presenter: (any AnyPresenter)?
    
    var pokemon: PokemonDetail?
    var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        return image
    }()
    var nameLabel: UILabel = initLabel()
    var idLabel = initLabel()
    var heigthLabel = initLabel()
    var weigthLabel = initLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(idLabel)
        view.addSubview(heigthLabel)
        view.addSubview(weigthLabel)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.frame = CGRect(x: 10, y: 10, width: 200, height: 200)
        nameLabel.frame = CGRect(x: 0, y: 10, width: view.bounds.width, height: 20)
        idLabel.frame = CGRect(x: 0, y: 40, width: view.bounds.width, height: 20)
        heigthLabel.frame = CGRect(x: 0, y: 70, width: view.bounds.width, height: 20)
        weigthLabel.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 20)
    }
    
    func update(with pokemons: [Pokemon]) {
        return
    }
    
    func update(with pokemon: PokemonDetail) {
        self.pokemon = pokemon
        DispatchQueue.main.async {
            self.getImage()
            self.nameLabel.text = pokemon.name
            self.idLabel.text = String(pokemon.id ?? 0)
            self.heigthLabel.text = String(pokemon.height ?? 0)
            self.weigthLabel.text = String(pokemon.weigth ?? 0)
        }
    }
    
    func update(with error: any Error) {
        DispatchQueue.main.async {
            self.nameLabel.text = error.localizedDescription
        }
    }
    
    func getImage() {
        DispatchQueue.global().async {
            let imageUrl = self.pokemon?.sprites?.front_default ?? ""
            guard let url = URL(string: imageUrl) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            guard let imageToSave = UIImage(data: imageData) else { return }
            DispatchQueue.main.async {
                self.imageView.image = imageToSave
            }
        }
    }
    
}

func initLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .white
    return label
}
