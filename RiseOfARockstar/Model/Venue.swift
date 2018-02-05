//
//  Gigs.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 30/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

struct Venue: Decodable {
    
    let name: String
    let requiredStars: Int
    let fixedEarnings: Int?
    let tipsCooldown: Int?
    let tipBaseValue: Int?
    let gigDuration: Int?
    
    let performanceBonus: Int
    let reputationBoost: Int?
    
    var relativeFixedEarnings: Double {
        return Double((fixedEarnings ?? 0)) / Double(Default.venueMaxFixedEarnings)
    }
    
    var relativeTipsEstimative: Double {
        guard tipsCooldown != nil, tipBaseValue != nil else { return 0 }
        
        let relativeCooldown = Double(Default.venueMinTipsCooldown) / Double(tipsCooldown!)
        let relativeBaseValue = Double(tipBaseValue!) / Double(Default.venueMaxTipsBaseValue)
        let relativePerformanceBonus = Double(performanceBonus) / Double(Default.venueMaxPerformanceBonus)
        return (relativeCooldown + relativeBaseValue + relativePerformanceBonus) / 3
    }
    
    var relativeReputationIncrease: Double {
        return Double(requiredStars) / 5
    }
    
    // calcula uma gorjeta com bônus pela performance
    func calculateTip(for player: Player) -> Int {
        return ((tipBaseValue ?? 0) + player.performance * performanceBonus) / 5
    }
    
    
}
