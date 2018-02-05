//
//  UIView.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 04/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

extension UIView  {
    func rotate(withDuration duration: TimeInterval, repeating: Bool = false) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = duration
        rotation.isCumulative = true
        rotation.repeatCount = repeating ? Float.greatestFiniteMagnitude : 1
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
