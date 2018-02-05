//
//  Default.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 03/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

// todo: carregar dados em tempo de execução, mas a pressa... :/

struct Default {
    
    // ciclos em uma gig
    static let gigDuration = 30
    
    // duração de cada ciclo da gig? (1 / gigTimeInterval = FPS)
    static let gigTimeInterval = 0.5
    
    // reputação necessária para ganhar uma estrela
    static let reputationPerStar = 1000
    
    // valor equivalente à barra cheia de técnica
    static let maxTechnique = 1000
    
    // valor equivalente à barra cheia de perfórmance
    static let maxPerformance = 1000
    
    // valor de uma aula na escola de música
    static let schoolLessonPrice = 100
    
    // valor de uma aula na escola de música
    static let schoolTechniqueIncreasePerLesson = 50
    
    // maior valor de cachê de uma casa de show
    static let venueMaxFixedEarnings = 2500
    
    // menor número de ciclos entre gorjetas
    static let venueMinTipsCooldown = 3
    
    // maior valor base de uma gorjeta
    static let venueMaxTipsBaseValue = 3
    
    // maior valor de bônus por perfórmance em uma casa de show
    static let venueMaxPerformanceBonus = 10
    
    // valor base de aumento de reputação nas gigs
    static let venueBaseReputationIncrease = 5
    
    // maior ganho de reputação em uma gig
    static let venueMaxReputationIncrease = 100
    
    // chance de aumentar a reputação a cada ciclo da gig
    static let chanceToIncreaseReputation = 0.25
    
    // chance de aumentar a técnica a cada ciclo da gig
    static let chanceToIncreaseTechnique = 0.25
}
