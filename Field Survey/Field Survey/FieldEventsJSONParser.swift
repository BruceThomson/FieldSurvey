//
//  SportingEventsJSONParser.swift
//  Sports Events
//
//  Created by Tech Innovator on 2/22/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import Foundation

//class FieldEventJSONParser {
//    
//    static let dateFormatter = DateFormatter()
//    
//    class func parse(_ data: Data) -> [FieldEvent] {
//        var fieldEvents = [FieldEvent]()
//        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
//        
//        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
//            let root = json as? [String: Any],
//            let status = root["status"] as? String,
//            status == "ok" {
//            if let observations = root["observations"] as? [Any] {
//                for observation in observations {
//                    if let observation = observation as? [String: Any] {
//                        if let classification = observation["classification"] as? field,
//                            let titleName = observation["title"] as? String,
//                            let description = observation["description"] as? String,
//                            let dateString = observation["date"] as? String,
//                            let date = dateFormatter.date(from: dateString) {
//                            
//                            if let fieldEvent = FieldEvent(classification: classification, titleName: titleName, description: description, date: date) {
//                                fieldEvents.append(fieldEvent)
//                            }
//                        }
//                        
//                    }
//                    
//                }
//                
//            }
//            
//        }
//        
//        return fieldEvents
//    }
//}

class FieldEventJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [FieldEvent] {
        var fieldEvents = [FieldEvent]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: Any] {
                        if let classification = observation["classification"] as? String,
                            let title = observation["title"] as? String,
                            let description = observation["description"] as? String,
                            let dateString = observation["date"] as? String,
                            let date = dateFormatter.date(from: dateString) {
                            
                            if let fieldEvent = FieldEvent(classification: classification, title: title, description: description, date: date) {
                                fieldEvents.append(fieldEvent)
                            }
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        return fieldEvents
    }
}
