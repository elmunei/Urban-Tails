//
//  ReviewVC.swift
//  Urban Tails
//
//  Created by Elvis Tapfumanei on 2018/04/05.
//  Copyright © 2018 Elvis Tapfumanei. All rights reserved.
//

import UIKit
import ProgressHUD

var _day: String?
var _month: String?
var _serviceTask: String?
var _time: String?
var _address: String?
var _phone: String?

class ReviewVC: UIViewController {

    
    //MARK: Outlets
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var serviceLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    @IBOutlet weak var serviceImg: UIImageView!
    
    
    var address: String = ""
    var phone: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.dismiss()
        serviceImg.image = UIImage(named: "\(_serviceTask!.trim())")
        dateLbl.text = _day!.trim()
        monthLbl.text = _month!.trim()
        serviceLbl.text = _serviceTask!.trim()
        timeLbl.text = _time!.trim()
        address = _address!.trim()
        phone = _phone!.trim()
        
        print("DEV: \(address)")
        print("DEV: \(phone)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation
     @IBAction func continueBtn(_ sender: Any) {
     }
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
