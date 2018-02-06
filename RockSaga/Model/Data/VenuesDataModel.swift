//
//  VenuesDataModel.swift
//  RockSaga
//
//  Created by Charles Ferreira on 31/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

final class VenuesDataModel {
    
    static let shared = VenuesDataModel()
    
    private let venues: [String: Venue]
    
    private init() {
        venues = SimpleJSON.read([String: Venue].self, fromResource: "venues")
    }
    
    func venue(withIdentifier venueID: String) -> Venue {
        guard let venue = venues[venueID] else {
            fatalError("Dados da casa indisponíveis. \(venueID)")
        }
        
        return venue
    }
    
}

