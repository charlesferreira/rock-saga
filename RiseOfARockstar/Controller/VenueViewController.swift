//
//  GigViewController.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 30/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import UIKit

class VenueViewController: CustomUIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var fixedEarningsStatsView: StatsView!
    @IBOutlet weak var estimatedTipStatsView: StatsView!
    @IBOutlet weak var reputationStatsView: StatsView!
    @IBOutlet weak var requiredStarsView: StarRatingView!
    @IBOutlet weak var starsUnderlayView: UIView!
    @IBOutlet weak var startGigButton: UIBarButtonItem!
    
    var venueID: String!
    
    private var venue: Venue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // carrega os dados da casa de show
        self.venue = VenuesDataModel.shared.venue(withIdentifier: venueID)
        
        navigationItem.title = venue.name
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        startGigButton.isEnabled = Player.shared.stars >= venue.requiredStars
        requiredStarsView.stars = venue.requiredStars
        backgroundImage.image = UIImage(named: venueID)
        starsUnderlayView.backgroundColor = startGigButton.isEnabled ? UIColor.green : UIColor.red
        fixedEarningsStatsView.progress = venue.relativeFixedEarnings
        estimatedTipStatsView.progress = venue.relativeTipsEstimative
        reputationStatsView.progress = venue.relativeReputationIncrease
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let gigController = segue.destination as? GigViewController else { return }
        
        gigController.venue = venue
    }

}
