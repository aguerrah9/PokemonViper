//
//  ListViewController.swift
//  PokemonViper
//
//  Created by Alejandro Guerra Hernandez on 21/01/25.
//

import Foundation
import UIKit

class ListViewController: UIViewController, AnyView {
    func update(with pokemon: PokemonDetail) {
        return
    }
    
    var presenter: (any AnyPresenter)?
    var pokemons: [Pokemon] = []
    
    var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    var messageLabel: UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Cargando..."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .link
        
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: 0, y: view.bounds.height / 2 - 10, width: view.bounds.width, height: 20)
    }
    
    func update(with pokemons: [Pokemon]) {
        DispatchQueue.main.async {
            self.pokemons = pokemons
            self.tableView.reloadData()
            self.tableView.isHidden = false
            self.messageLabel.isHidden = true
        }
    }
    func update(with error: Error) {
        DispatchQueue.main.async {
            self.pokemons = []
            self.tableView.isHidden = true
            self.messageLabel.text = error.localizedDescription
            self.messageLabel.isHidden = false
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = pokemons[indexPath.row].name
        
        cell.contentConfiguration = content
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.viewDidSelect(url: pokemons[indexPath.row].url)
    }
}
