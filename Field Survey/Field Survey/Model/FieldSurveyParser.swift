//
//  FieldSurveyParser.swift
//  Field Survey
//
//  Created by Brian Jiang on 7/14/19.
//  Copyright © 2019 Brian Jiang. All rights reserved.
//

import Foundation

class FieldSurveyParser {
    class func parse(_ data: Data) -> [FieldSurveyEvent] {
        let dateFormatter = DateFormatter()
        
        var fieldsurveys = [FieldSurveyEvent]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
            if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["Status"] as? String,
            status == "ok"
        {
            if let loader = root["loader"] as? [Any] {
                for load in loader {
                    if let load = load as? [String: String] {
                        if let classification = load["classification"],
                        let title = load["title"],
                        let description = load["description"],
                        let dateString = load["date"],
                        let date = dateFormatter.date(from: dateString) {
                            
                            if let fieldsurveyEvent = FieldSurveyEvent(classification: classification, title: title, description: description, date: date) {
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
