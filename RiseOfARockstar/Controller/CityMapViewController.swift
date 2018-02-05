//
//  FirstViewController.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 30/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import UIKit

class CityMapViewController: CustomUIViewController {
    
    @IBAction func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let venueController = segue.destination as? VenueViewController,
            let venueID = segue.identifier {
            venueController.venueID = venueID
        }
        
    }

}

