//
//  ServicesViC.swift
//  Urban Tails
//
//  Created by Elvis Tapfumanei on 2018/04/08.
//  Copyright © 2018 Elvis Tapfumanei. All rights reserved.
//

import UIKit

class ServicesViC: UIViewController {

    
    
    @IBOutlet weak var pStatusLbl: UILabel!
    @IBOutlet weak var serviceImg: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var approvedImg: UIImageView!
    @IBOutlet weak var approvedTxt: UILabel!
    @IBOutlet weak var cardFlag: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let indexPath = selectedIndex {
            let selectedRow = model.services[indexPath.item]
            
            serviceImg.image = UIImage(named: selectedRow["service"]!)
            dayLbl.text = selectedRow["day"]
            serviceTitle.text = selectedRow["service"]
            timeLbl.text = selectedRow["time"]
            monthLbl.text = selectedRow["month"]
            approvedImg.image = UIImage(named: selectedRow["approved-image"]!)
            approvedTxt.text = selectedRow["approved-text"]
            pStatusLbl.text = selectedRow["payment"]
         
        }
        
        if approvedImg.image == UIImage(named: "approved_img_green") {
            approvedImg.isHidden = true
            approvedTxt.isHidden = true
            pStatusLbl.textColor = UIColor(named: "orange")
            cardFlag.backgroundColor = UIColor(named: "orange")
            
        } else {
            approvedImg.isHidden = false
            approvedTxt.isHidden = false
            pStatusLbl.textColor = UIColor(named: "green")
            cardFlag.backgroundColor = UIColor(named: "green")

        }
        
        
        // tap to dismiss
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(ServicesViC.dismiss(_:)))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Properties
    var selectedIndex: IndexPath?

    @IBOutlet weak var cancelBtn: UIImageView!
    
    
    // phone number tap
    @objc func dismiss(_ recognizer : UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
        
    }

}
