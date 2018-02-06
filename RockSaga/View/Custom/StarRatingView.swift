//
//  StarRatingView.swift
//  RockSaga
//
//  Created by Charles Ferreira on 04/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

class StarRatingView: CustomView {
    
    @IBOutlet weak var starsContainer: UIView!
    
    var stars: Int = 1 {
        didSet {
            updateRating()
        }
    }
    
    func updateRating() {
        starsContainer.subviews.enumerated().forEach { (offset, element) in
            let star = element as? UIImageView
//            star?.image = offset < stars ? #imageLiteral(resourceName: "rating-on") : #imageLiteral(resourceName: "rating-off")
            star?.image = #imageLiteral(resourceName: "rating-on")
            star?.alpha = offset < stars ? 1 : 0.125
        }
    }
}
