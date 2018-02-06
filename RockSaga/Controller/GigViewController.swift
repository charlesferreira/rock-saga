//
//  GigRollingViewController.swift
//  RockSaga
//
//  Created by Charles Ferreira on 31/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import AVFoundation
import UIKit
import CoreMotion

class GigViewController: CustomUIViewController {
    
    @IBOutlet weak var instructionsOverlayView: UIView!
    
    var motionManager = CMMotionManager()
    var deviceRotation: CMRotationRate!
    var touchLocation = CGPoint()
    
    // gig
    var venue: Venue!
    var gig: Gig!
    
    // dynamics
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configura a física da cena
        startDynamics()
        
        // configura a leitura do acelerômetro
        motionManager.gyroUpdateInterval = 0.05
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            guard let data = data else { return }
            
            self.deviceRotation = data.rotationRate
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // encerra a gig
        gig.quit()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gig == nil {
            startGig()
            return
        }
        
        guard let touch = touches.first else { return }
        
        // armazena o local do toque para efeitos extra...
        touchLocation = touch.location(in: view)
        
        // cria um efeito no local do toque
        createRipple(at: touchLocation)
        
        // atualiza manualmente a gig, acelerando assim
        // a evolução do jogador e aumentando os bônus
        gig.tryHard()
    }

    private func startGig() {
        gig = Gig(at: venue)
        gig.delegate = self
        
        UIView.animate(withDuration: 1) {
            self.instructionsOverlayView.alpha = 0
        }
    }
    
    private func createRipple(at location: CGPoint) {
        let ripple = GuitarStrikeFXView(image: #imageLiteral(resourceName: "rating-on"))
        ripple.pitch = Float(deviceRotation.z)
        
        let size = ripple.image!.size
        let origin = CGPoint(x: location.x - size.width / 2, y: location.y - size.height / 2)
        ripple.frame = CGRect(origin: origin, size: size)
        view.addSubview(ripple)
    }
}
