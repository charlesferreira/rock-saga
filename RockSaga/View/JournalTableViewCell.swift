//
//  JournalTableViewCell.swift
//  RockSaga
//
//  Created by Charles Ferreira on 02/02/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

class JournalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var entryLabel: UITextView!
    
    var entry: (day: Int, message: String)! {
        didSet {
            dayLabel.text = "Dia \(entry.day.description)"
            entryLabel.text = entry.message
        }
    }
}
