//
//  Player.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 30/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

class Player {
    
    static let shared = Player()
    
    var cash: Int
    var technique: Int
    var instrument: ShopItem
    var reputation: Int
    
    var stars: Int {
        return Int(max(1, min(5, ceil(Double(reputation) / Double(Default.reputationPerStar)))))
    }
    
    var performance: Int {
        // perfórmance vem metade da técnica e metade do instrumento,
        // assim como na vida real... 😂
        return (technique + Int(instrument.quality * Double(Default.maxTechnique))) / 2
    }
    
    var relativeTechnique: Double {
        return Double(Player.shared.technique) / Double(Default.maxTechnique)
    }
    
    var relativePerformance: Double {
        return Double(Player.shared.performance) / Double(Default.maxPerformance)
    }
    
    private init() {
        // todo: ler valores do userPreferences?
        
        cash = 0
        technique = 20
        reputation = 0
        instrument = ShopDataModel.shared.shop.items[0]
    }
    
}
