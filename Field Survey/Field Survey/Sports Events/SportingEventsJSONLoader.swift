//
//  SportingEvent.swift
//  Sports Events
//
//  Created by Tech Innovator on 2/22/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import Foundation

class SportingEventsJSONLoader {

    class func load(fileName: String) -> [SportingEvent] {
        var events = [SportingEvent]()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            events = SportingEventJSONParser.parse(data)
        }
        return events
    }
}
