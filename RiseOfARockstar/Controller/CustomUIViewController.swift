//
//  UIViewController.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 02/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

class CustomUIViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func blurBackground(imageView: UIImageView) {
        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)
    }
    
}
