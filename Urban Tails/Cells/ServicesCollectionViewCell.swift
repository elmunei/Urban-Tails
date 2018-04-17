//
//  ServicesCollectionViewCell.swift
//  Urban Tails
//
//  Created by Elvis Tapfumanei on 2018/04/06.
//  Copyright © 2018 Elvis Tapfumanei. All rights reserved.
//

import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorFlag: CustomizableView!
    @IBOutlet weak var approvedImg: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var serviceLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var paymentStatus: UILabel!
    
    
    
    var inspiration:Inspiration?{
        didSet{
            if let inspiration = inspiration{
                dayLbl.text = inspiration.day
                monthLbl.text = inspiration.month
                serviceLbl.text = inspiration.service
                timeLbl.text = inspiration.time
                paymentStatus.text = inspiration.payStatus
            }
        }
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        // 1
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        
        // 2
        let delta = 1 - ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
        
        // 3
//        let minAlpha: CGFloat = 0.3
//        let maxAlpha: CGFloat = 0.75
//        dayLbl.alpha = delta
        monthLbl.alpha = delta
//        serviceLbl.alpha = delta
        timeLbl.alpha = delta
        paymentStatus.alpha = delta
        colorFlag.alpha = delta
    }
    
}
