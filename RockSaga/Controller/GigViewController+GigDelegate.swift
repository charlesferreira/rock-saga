//
//  GigViewController+GigDelegate.swift
//  RockSaga
//
//  Created by Charles Ferreira on 01/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

extension GigViewController: GigDelegate {
    
    func createObject(withContents contents: String, at location: CGPoint) {
        // representação visual
        let label = UILabel(frame: CGRect(x: -20, y: -20, width: 80, height: 80))
        label.text = contents
        label.textAlignment = .center
        label.font = label.font.withSize(60)
        
        // container com física
        let coinContainer = UIView(frame: CGRect(x: location.x, y: location.y, width: 40, height: 40))
        coinContainer.addSubview(label)
        view.addSubview(coinContainer)
        
        // adiciona colisão
        collision.addItem(coinContainer)
        
        // adiciona gravidade ao objeto
        gravity.addItem(coinContainer)
    }
    
    func gig(_ gig: Gig, didGenerateTipWorth tipAmount: Int) {
        let contentsArray = ["💰","💶","💎"]
        let randomIndex = Int(arc4random_uniform(UInt32(contentsArray.count)))
        let randomContent = contentsArray[randomIndex]
        createObject(withContents: randomContent, at: touchLocation)
    }
    
    func gig(_ gig: Gig, didIncreaseReputationBy reputationIncrease: Int) {
        let contentsArray = ["🤟","❤️","🌟","🎸"]
        let randomIndex = Int(arc4random_uniform(UInt32(contentsArray.count)))
        let randomContent = contentsArray[randomIndex]
        createObject(withContents: randomContent, at: touchLocation)
    }
    
    func gigEnded(_ gig: Gig, keepingEarnings hasKeptEarnings: Bool) {
        // grava a entrada no diário
        Journal.shared.log(JournalEntry.gig(venue: gig.venue, firstTime: Journal.shared.firstTimeAt(venue)))
        
        // apresenta a tela de resultados
        performSegue(withIdentifier: "PresentGigResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? GigResultsViewController {
            controller.gig = gig
        }
    }
}
