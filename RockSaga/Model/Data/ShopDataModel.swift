//
//  ShopDataModel.swift
//  RockSaga
//
//  Created by Charles Ferreira on 31/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

final class ShopDataModel {
    
    static let shared = ShopDataModel()
    
    let shop: Shop
    
    private init() {
        shop = SimpleJSON.read(Shop.self, fromResource: "shop")
    }
    
}
