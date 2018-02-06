//
//  GigDelegate.swift
//  RockSaga
//
//  Created by Charles Ferreira on 01/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

protocol GigDelegate: AnyObject {
    
    func gig(_ gig: Gig, didGenerateTipWorth tipAmount: Int)
    
    func gig(_ gig: Gig, didIncreaseReputationBy reputationIncrease: Int)
    
    func gigEnded(_ gig: Gig, keepingEarnings hasKeptEarnings: Bool)
}
