//
//  Gig.swift
//  RockSaga
//
//  Created by Charles Ferreira on 01/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

class Gig {

    // public
    weak var delegate: GigDelegate?
    let venue: Venue
    
    // public read
    private (set) var earnings: Int
    private (set) var technique: Int = 0
    private (set) var reputation: Int = 0
    
    // private
    private var tipsCooldown: Int?
    private var duration: Int
    private var timer: Timer!

    // helper
    private unowned var player: Player = Player.shared
    
    // computed properties
    private var shouldIncreaseReputation: Bool {
        return drand48() < Default.chanceToIncreaseReputation
    }
    
    // computed properties
    private var shouldIncreaseTechnique: Bool {
        return drand48() < Default.chanceToIncreaseTechnique
    }
    
    // começa uma gig no local determinado
    init(at venue: Venue) {
        self.venue = venue
        self.earnings = venue.fixedEarnings ?? 0
        self.tipsCooldown = venue.tipsCooldown
        self.duration = venue.gigDuration ?? Default.gigDuration
        self.timer = Timer.scheduledTimer(timeInterval: Default.gigTimeInterval, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    // abandona a gig
    func quit() {
        timer.invalidate()
    }
    
    // força uma atualização da gig sem avançar o cronômetro
    func tryHard() {
        update(advancingTime: false)
    }
    
    // atualiza a gig e avança o cronômetro
    @objc func tick() {
        update(advancingTime: true)
    }
    
    // "gameloop"
    private func update(advancingTime: Bool) {
        guard duration > 0 else { return }
        
        // atualizações
        updateTips()
        updateTechnique()
        updateReputation()
        
        guard advancingTime else { return }
        
        // verifica o fim da gig
        duration -= 1
        if duration <= 0 {
            timer.invalidate()
            delegate?.gigEnded(self, keepingEarnings: true)
        }
    }
    
    // atualização das gorjetas
    private func updateTips() {
        guard tipsCooldown != nil else { return }
        
        // verifica se é hora da gorjeta
        if tipsCooldown! > 0 {
            tipsCooldown! -= 1
            return
        }
        
        // calcula a gorjeta e notifica o delegate
        let tipAmount = venue.calculateTip(for: player)
        earnings += tipAmount
        delegate?.gig(self, didGenerateTipWorth: tipAmount)
        
        // reinicia o cooldown
        tipsCooldown = venue.tipsCooldown
    }
    
    private func updateTechnique() {
        guard shouldIncreaseTechnique else { return }
        technique += 1
    }
    
    private func updateReputation() {
        guard shouldIncreaseReputation else { return }
        
        // gera um aumento de reputação e notifica o delegate
        let reputationIncrease = Default.venueBaseReputationIncrease + Int(arc4random_uniform(UInt32(venue.reputationBoost ?? 0)))
        reputation += reputationIncrease
        delegate?.gig(self, didIncreaseReputationBy: reputationIncrease)
    }
}
