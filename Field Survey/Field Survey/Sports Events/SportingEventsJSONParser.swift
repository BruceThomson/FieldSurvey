//
//  SportingEventsJSONParser.swift
//  Sports Events
//
//  Created by Tech Innovator on 2/22/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import Foundation

class SportingEventJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [SportingEvent] {
        var sportingEvents = [SportingEvent]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            if let events = root["events"] as? [Any] {
                for event in events {
                    if let event = event as? [String: Any] {
                        if let sportName = event["sport"] as? String,
                            let matchup = event["matchup"] as? String,
                            let dateString = event["date"] as? String,
                            let date = dateFormatter.date(from: dateString) {
                            
                            if let sportingEvent = SportingEvent(sportName: sportName, matchup: matchup, date: date) {
                                sportingEvents.append(sportingEvent)
                            }
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        return sportingEvents
    }
}
