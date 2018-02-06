//
//  GigResults.swift
//  RockSaga
//
//  Created by Charles Ferreira on 04/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

class GigResultsViewController: CustomUIViewController {
    
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var reputationLabel: UILabel!
    @IBOutlet weak var reputationForNextStar: UILabel!
    
    private var waiting = true
    
    var gig: Gig!
    
    override func viewDidLoad() {
        // atualiza os dados do jogador
        Player.shared.cash += gig.earnings
        Player.shared.technique += gig.technique
        Player.shared.reputation += gig.reputation
        
        // atualiza as labels
        cashLabel.text = "$ \(gig.earnings)"
        reputationLabel.text = "+\(gig.reputation)"
        
        // oculta a "reputação para próxima estrela" se já tem 5 estrelas
        guard Player.shared.reputation < Default.reputationPerStar * 5 else {
            reputationForNextStar.isHidden = true
            return
        }
        
        // atualiza a label de reputação restante
        let reputationLeft = Default.reputationPerStar - (Player.shared.reputation % Default.reputationPerStar)
        reputationForNextStar.text = reputationForNextStar.text?.replacingOccurrences(of: "###", with: reputationLeft.description)
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            self.waiting = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !waiting else { return }
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "MyTabBarController") as? MyTabBarController {
            present(controller, animated: true, completion: nil)
        }
    }
    
}
