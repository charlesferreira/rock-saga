//
//  ProfileViewController.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 02/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: CustomUIViewController {
    
    @IBOutlet weak var techniqueStatsView: StatsView!
    @IBOutlet weak var performanceStatsView: StatsView!
    @IBOutlet weak var starsView: StarRatingView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        techniqueStatsView.progress = Player.shared.relativeTechnique
        performanceStatsView.progress = Player.shared.relativePerformance
        starsView.stars = Player.shared.stars
    }
}
