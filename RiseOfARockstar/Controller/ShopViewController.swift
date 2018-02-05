//
//  SecondViewController.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 30/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import UIKit

class ShopViewController: CustomUIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private weak var playerCashController: PlayerCashViewController!
    
    private var shop: Shop!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delagates
        tableView.delegate = self
        tableView.dataSource = self
        
        // carrega os dados da loja
        shop = ShopDataModel.shared.shop
        
        // atualiza as informações da cena
        navigationItem.title = shop.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        playerCashController.updateCashLabel()
        tableView.reloadData()
    }
    
    // número de itens na loja
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shop.items.count
    }
    
    // fornece cada item da loja
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShopItemTableViewCell", for: indexPath) as? ShopItemTableViewCell else {
            fatalError("Não foi possível criar a célula do item da loja")
        }
        
        cell.shopItem = shop.items[indexPath.item]
        
        return cell
    }
    
    // ação ao tocar em um item da loja
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // abre popup confirmando a compra
        let shopItem = shop.items[indexPath.item]
        let alert = UIAlertController(title: "\(shopItem.brand) \(shopItem.model)", message: "Confirmar compra?", preferredStyle: .alert)
        
        // realiza a compra do item
        alert.addAction(UIAlertAction(title: "Yeah! ($\(shopItem.price.description))", style: .default, handler: { (_) in
            Player.shared.instrument = shopItem
            Player.shared.cash -= shopItem.price
            self.playerCashController.updateCashLabel()
            self.playerCashController.animateCashContainer()
            
            // grava a entrada no diário
            Journal.shared.log(JournalEntry.newGuitar(shopItem))
            
            tableView.reloadData()
        }))
        
        // cancela a compra
        alert.addAction(UIAlertAction(title: "Nah", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? PlayerCashViewController {
            playerCashController = controller
        }
    }
    
}

