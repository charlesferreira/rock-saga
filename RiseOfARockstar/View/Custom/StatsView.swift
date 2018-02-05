//
//  StatsView.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 04/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

class StatsView: CustomView {
    
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    var progress: Double? {
        didSet {
            updateProgressView()
        }
    }
    
    private func updateProgressView() {
        layoutIfNeeded()
        
        let superViewWidth = progressView.superview!.frame.width
        let width = min(superViewWidth, superViewWidth * CGFloat(progress ?? 0))
        
        UIView.animate(withDuration: 1) {
            self.widthConstraint.constant = width
            self.layoutIfNeeded()
        }
    }

}
