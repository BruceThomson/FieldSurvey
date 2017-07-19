//
//  SportingEvent.swift
//  Sports Events
//
//  Created by Tech Innovator on 2/22/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import Foundation

struct SportingEvent {
    var sport: Sport
    var matchup: String
    var date: Date
    
    init(sport: Sport, matchup: String, date: Date) {
        self.sport = sport
        self.matchup = matchup
        self.date = date
    }
    
    init?(sportName: String, matchup: String, date: Date) {
        if let sport = Sport(rawValue: sportName.lowercased()) {
            self.init(sport: sport, matchup: matchup, date: date)
        } else {
            return nil
        }
    }
}
