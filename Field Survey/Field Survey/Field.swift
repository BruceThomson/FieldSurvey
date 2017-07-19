//
//  Sport.swift
//  Sports Events
//
//  Created by Tech Innovator on 2/22/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import UIKit

enum field: String {
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
