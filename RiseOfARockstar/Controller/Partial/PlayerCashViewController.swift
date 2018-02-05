//
//  PlayerCashViewController.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 03/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

class PlayerCashViewController: CustomUIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cashLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        cashLabel.text = "$ \(Player.shared.cash.description)"
    }
    
    func updateCashLabel() {
        cashLabel.text = "$ \(Player.shared.cash.description)"
    }
    
    func animateCashContainer() {
        let originalColor = containerView.backgroundColor
        containerView.backgroundColor = UIColor.red
        UIView.animate(withDuration: 1) {
            self.containerView.backgroundColor = originalColor
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Player.shared.cash += 1000
        updateCashLabel()
    }
    
}
