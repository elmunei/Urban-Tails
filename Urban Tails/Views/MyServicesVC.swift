//
//  MyServicesVC.swift
//  Urban Tails
//
//  Created by Elvis Tapfumanei on 2018/04/06.
//  Copyright © 2018 Elvis Tapfumanei. All rights reserved.
//

import UIKit
import AZSafariCollectionViewLayout

class MyServicesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let exploreLayout = AZExploreCollectionViewLayout()
    let browsingLayout = AZSafariCollectionViewLayout()
    var isSelected = false
    
    let inspirations = Inspiration.allInspirations()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setCollectionViewLayout(browsingLayout, animated: true)
        browsingLayout.itemHeight = 150
        browsingLayout.itemGap = 60
        browsingLayout.itemAngleOfRotation = -5
        
        collectionView!.backgroundColor = UIColor.clear
        collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewService(_ sender: Any) {
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyServicesVC {
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.services.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCell", for: indexPath) as! ServicesCollectionViewCell
        cell.dayLbl.text = model.services[indexPath.row]["day"]
        cell.monthLbl.text = model.services[indexPath.row]["month"]
        cell.serviceLbl.text = model.services[indexPath.row]["service"]
        cell.timeLbl.text = model.services[indexPath.row]["time"]
        cell.paymentStatus.text = model.services[indexPath.row]["payment"]
        cell.approvedImg.image = UIImage(named: model.services[indexPath.row]["payment-icon"]!)
        cell.colorFlag.backgroundColor = UIColor(named: model.services[indexPath.row]["top-color"]!)
        
        return cell
    }
    
//     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("DEV: cell selectted")
//        if self.isSelected == false {
//            collectionView.setCollectionViewLayout(self.exploreLayout, animated: true)
//            self.isSelected = true
//
//        }
//        else {
//            collectionView.setCollectionViewLayout(self.browsingLayout, animated: true)
//            self.isSelected = false
//        }
////        let layout =  UltravisualLayout()
////        let offset = layout.dragOffset * CGFloat(indexPath.item)
////        if collectionView.contentOffset.y != offset {
////            collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
////        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToServiceView" {
            let postViewController = segue.destination as! ServicesViC
            let cell = sender as! UICollectionViewCell
            
            postViewController.selectedIndex = collectionView?.indexPath(for: cell)
            
        }
        
    }
    
}
