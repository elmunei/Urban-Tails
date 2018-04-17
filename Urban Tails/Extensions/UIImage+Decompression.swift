//
//  UIImage+Decompression.swift
//  Urban Tails
//
//  Created by Elvis Tapfumanei on 2018/04/06.
//  Copyright © 2018 Elvis Tapfumanei. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    
    var decompressedImage:UIImage{
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(at: CGPoint.zero)
        let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return decompressedImage!
    }
}
