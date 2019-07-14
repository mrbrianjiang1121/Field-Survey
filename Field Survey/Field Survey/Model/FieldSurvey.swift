//
//  FieldSurvey.swift
//  Field Survey
//
//  Created by Brian Jiang on 7/14/19.
//  Copyright © 2019 Brian Jiang. All rights reserved.
//

import UIKit

enum FieldSurvey: String {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}


