//
//  Shop.swift
//  RockSaga
//
//  Created by Charles Ferreira on 30/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

struct Shop: Decodable {
    
    let name: String
    let items: [ShopItem]
    
}
