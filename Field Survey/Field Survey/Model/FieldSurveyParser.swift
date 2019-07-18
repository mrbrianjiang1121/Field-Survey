//
//  FieldSurveyParser.swift
//  Field Survey
//
//  Created by Brian Jiang on 7/14/19.
//  Copyright © 2019 Brian Jiang. All rights reserved.
//

import Foundation

class FieldSurveyParser {
    static let dateFormatter = DateFormatter()
    class func parse(_ data: Data) -> [FieldSurveyEvent] {
        
        var fieldsurveys = [FieldSurveyEvent]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
            if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
                
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: String] {
                        if let classificationName = observation["classification"],
                        let title = observation["title"],
                        let description = observation["description"],
                        let dateString = observation["date"],
                        let date = dateFormatter.date(from: dateString) {
                            
                            if let fieldsurveyEvent = FieldSurveyEvent(classificationName: classificationName, title: title, description: description, date: date) {
                                fieldsurveys.append(fieldsurveyEvent)
                            }
                        }
                    }
                }
            }
        }
        
        return fieldsurveys
    }
    
    
}
