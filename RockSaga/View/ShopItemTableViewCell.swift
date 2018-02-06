//
//  ShopTableViewCell.swift
//  RockSaga
//
//  Created by Charles Ferreira on 31/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import UIKit

class ShopItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var qualityView: StatsView!
    
    var shopItem: ShopItem! {
        didSet {
            brandLabel.text = shopItem.brand
            modelLabel.text = shopItem.model
            priceLabel.text = "$ \(shopItem.price.description)"
            qualityView.progress = shopItem.quality
            
            starImage.isHidden = !isCurrentItem
            priceLabel.isHidden = isCurrentItem || !isItemQualityBetter
            overlayView.isHidden = purchaseAllowed
            isUserInteractionEnabled = purchaseAllowed
            
            if !isItemQualityBetter {
                overlayView.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    private var isCurrentItem: Bool {
        return shopItem.price == Player.shared.instrument.price
    }
    
    private var isItemTooExpensive: Bool {
        return Player.shared.cash < shopItem.price
    }
    
    private var isItemQualityBetter: Bool {
        return shopItem.quality > Player.shared.instrument.quality
    }
    
    private var purchaseAllowed: Bool {
        return !isItemTooExpensive && isItemQualityBetter
    }
    
}
