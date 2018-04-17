//
//  Inspiration.swift
//  Urban Tails
//
//  Created by Elvis Tapfumanei on 2018/04/06.
//  Copyright © 2018 Elvis Tapfumanei. All rights reserved.
//

import Foundation
import UIKit

class Inspiration:Session{
    class func allInspirations() -> [Inspiration] {
        var inspirations = [Inspiration]()
        if let URL = Bundle.main.url(forResource: "Services", withExtension: "plist") {
            if let tutorialsFromPlist = NSArray(contentsOf: URL) {
                for dictionary in tutorialsFromPlist {
                    let inspiration = Inspiration(dictionary: dictionary as! NSDictionary)
                    inspirations.append(inspiration)
                }
            }
        }
        return inspirations
    }

}
