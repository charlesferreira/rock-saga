//
//  ShopItem.swift
//  RockSaga
//
//  Created by Charles Ferreira on 31/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

struct ShopItem: Decodable {
    
    let brand: String
    let model: String
    let price: Int
    let quality: Double
    
}
