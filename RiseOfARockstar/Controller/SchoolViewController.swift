//
//  SchoolViewController.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 02/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

class SchoolViewController: CustomUIViewController {
    
    @IBOutlet weak var lessonPriceLabel: UILabel!
    @IBOutlet weak var buyLessonButton: UIButton!
    
    @IBOutlet weak var techniqueStatsView: StatsView!
    @IBOutlet weak var performanceStatsView: StatsView!
    
    private weak var playerCashController: PlayerCashViewController!
    
    private var playerHasEnoughMoney: Bool {
        return Player.shared.cash >= Default.schoolLessonPrice
    }
    
    private var hasMarginForImprovement: Bool {
        return Player.shared.technique < Default.maxTechnique
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateButton()
        updateStats()
    }
    
    @IBAction func buyLesson(_ sender: Any) {
        guard playerHasEnoughMoney else { return }
        
        Player.shared.cash -= Default.schoolLessonPrice
        Player.shared.technique += Default.schoolTechniqueIncreasePerLesson
        updateStats()
        playerCashController.updateCashLabel()
        playerCashController.animateCashContainer()
        
        updateButton()
    }
    
    private func updateButton() {
        buyLessonButton.isEnabled = playerHasEnoughMoney && hasMarginForImprovement
        buyLessonButton.alpha = buyLessonButton.isEnabled ? 1 : 0.3
    }
    
    private func updateStats() {
        techniqueStatsView.progress = Player.shared.relativeTechnique
        performanceStatsView.progress = Player.shared.relativePerformance
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? PlayerCashViewController {
            playerCashController = controller
        }
    }
    
}

