//
//  Session.swift
//  Urban Tails
//
//  Created by Elvis Tapfumanei on 2018/04/06.
//  Copyright © 2018 Elvis Tapfumanei. All rights reserved.
//

import Foundation
import UIKit

class Session{
    
    var day: String
    var month: String
    var service: String
    var time: String
    var payStatus: String
    
    var roomAndTime:String{
        get{
            return "\(time) • \(service)"
        }
    }
   
    init(day:String, month:String, service:String, time:String, payStatus:String){
        self.day = day
        self.month = month
        self.service = service
        self.time = time
        self.payStatus = payStatus
    }
    
    convenience init (dictionary:NSDictionary){
        let Day = dictionary["Day"] as? String
        let Month = dictionary["Month"] as? String
        let Service = dictionary["Service"] as? String
        let time = dictionary["Time"] as? String
        let payStatus = dictionary["Pstatus"] as? String
        
        self.init(day: Day!, month: Month!, service: Service!, time: time!, payStatus: payStatus!)
    }
    
}


