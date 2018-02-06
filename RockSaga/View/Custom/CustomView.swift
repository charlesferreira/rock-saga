//
//  CustomView.swift
//  RockSaga
//
//  Created by Charles Ferreira on 04/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    func loadFromNib() {
        // pulo do gato: utiliza o nome da classe polimorficamente
        // para encontrar o arquivo .XIB de mesmo nome... oh yeah! 🤟
        let nibName = String(describing: self.classForCoder)
        let contentView = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as! UIView
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
