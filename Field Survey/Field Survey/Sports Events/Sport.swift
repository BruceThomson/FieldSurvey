//
//  Sport.swift
//  Sports Events
//
//  Created by Tech Innovator on 2/22/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import UIKit

enum Sport: String {
    case baseball
    case basketball
    case football
    case hockey
    case soccer
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
    
}
