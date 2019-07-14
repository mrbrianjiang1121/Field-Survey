//
//  FieldSurveyEvent.swift
//  Field Survey
//
//  Created by Brian Jiang on 7/14/19.
//  Copyright © 2019 Brian Jiang. All rights reserved.
//

import Foundation

struct FieldSurveyEvent {
    let title: FieldSurvey
    let description: String
    let date: Date
    
    init(title: FieldSurvey, description: String, date: Date) {
        self.title = title
        self.description = description
        self.date = date
    }
    
    init?(title: String, description: String, date: Date) {
        if let title = FieldSurvey(rawValue: title) {
            self.init(title: title, description: description, date: date)
        } else {
            return nil
        }
    }
}
