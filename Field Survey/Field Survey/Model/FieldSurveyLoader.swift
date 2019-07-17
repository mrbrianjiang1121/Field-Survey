//
//  FieldSurveyLoader.swift
//  Field Survey
//
//  Created by Brian Jiang on 7/14/19.
//  Copyright © 2019 Brian Jiang. All rights reserved.
//

import Foundation

class FieldSurveyLoader {
    class func load(fileName: String) -> [FieldSurveyEvent] {
        var loads = [FieldSurveyEvent]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            loads = FieldSurveyParser.parse(data)
        }
        
        return loads
    }
    
}
