//
//  SportingEvent.swift
//  Sports Events
//
//  Created by Tech Innovator on 2/22/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import Foundation

struct FieldEvent {
    var classification: field
    var title: String
    var description: String
    var date: Date
    
    init(classification: field, title: String, description: String, date: Date) {
        self.classification = classification
        self.title = title
        self.description = description
        self.date = date
    }
    
    init?(classification: String, title: String, description: String, date: Date) {
        if let classification = field(rawValue: classification.lowercased()) {
            self.init(classification: classification, title: title, description: description, date: date)
        } else {
            return nil
        }
    }
}
