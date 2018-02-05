//
//  Journal.swift
//  RiseOfARockstar
//
//  Created by Charles Ferreira on 04/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

class Journal {
    
    static let shared = Journal()
    
    var entries = [(day: Int, message: String)]()
    
    var venuesAlreadyPlayedAt = Set<String>()
    
    var currentDay = 1
    
    private init() {
        log(JournalEntry.newGame)
    }
    
    func firstTimeAt(_ venue: Venue) -> Bool {
        return venuesAlreadyPlayedAt.contains(venue.name)
    }
    
    func log(_ entry: JournalEntry) {
        entries.append((day: currentDay, message: entry.toString()))
        currentDay += 1
        
        switch entry {
        case .gig(let venue, _):
            venuesAlreadyPlayedAt.insert(venue.name)
        default:
            break
        }
    }
    
}
