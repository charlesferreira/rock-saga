//
//  GigViewController+Dynamics.swift
//  RockSaga
//
//  Created by Charles Ferreira on 01/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

extension GigViewController {
    
    func startDynamics() {
        // cria o animator
        animator = UIDynamicAnimator(referenceView: view)
        
        // adiciona gravidade
        gravity = UIGravityBehavior()
        animator.addBehavior(gravity)
        
        // adiciona detecção de colisões
        collision = UICollisionBehavior()
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
}
