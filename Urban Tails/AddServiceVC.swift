//
//  AddServiceVC.swift
//  Urban Tails
//
//  Created by Elvis Tapfumanei on 2018/04/03.
//  Copyright © 2018 Elvis Tapfumanei. All rights reserved.
//

import UIKit
import DateTimePicker
import CTKFlagPhoneNumber
import GooglePlacePicker
import SwiftyPickerPopover
import ProgressHUD
import NotificationBannerSwift

class AddServiceVC: UIViewController, DateTimePickerDelegate, UITextFieldDelegate {

    
    
    //Outlets
    @IBOutlet weak var serviceTxt: CustomizableTextfield!{
        didSet{
            serviceTxt.delegate = self
        }
    }
    @IBOutlet weak var dateTimeTxt: CustomizableTextfield!{
        didSet{
            dateTimeTxt.delegate = self
        }
    }
    @IBOutlet weak var locationTxt: CustomizableTextfield!{
        didSet{
            locationTxt.delegate = self
        }
    }
    @IBOutlet weak var phoneNumberTxt: CTKFlagPhoneNumberTextField!{
        didSet{
            phoneNumberTxt.delegate = self
        }
    }
    @IBOutlet weak var pickerDT: UIDatePicker!
    
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var screenLbl: UILabel!
    
    
     var picker: DateTimePicker?
    
    var day: String?
    var month: String?
    var serviceTask: String?
    var time: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       continueBtn.isEnabled = false
        
        // tap to hide keyboard
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(AddServiceVC.hideKeyboard(_:)))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
        
        // tap to show location
        let serviceRecognizer = UITapGestureRecognizer()
        serviceRecognizer.addTarget(self, action: #selector(serviceRequired(_:)))
        serviceTxt.addGestureRecognizer(serviceRecognizer)
        
       // tap to show date and time
        let dateTimeTapRecognizer = UITapGestureRecognizer()
        dateTimeTapRecognizer.addTarget(self, action: #selector(dateTime(_:)))
         dateTimeTxt.addGestureRecognizer(dateTimeTapRecognizer)
        
        // tap to show location
        let locationRecognizer = UITapGestureRecognizer()
        locationRecognizer.addTarget(self, action: #selector(location(_:)))
        locationTxt.addGestureRecognizer(locationRecognizer)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    
    // hide keyboard tap
    @objc func hideKeyboard(_ recognizer : UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    // service required tap
    @objc func serviceRequired(_ recognizer : UITapGestureRecognizer) {
//        StringPickerPopover(title: "Select one", choices: ["Dog Walking","Dog Training","Cat Sitting", "Pet Training", "Horse Sitting"])
//            .setSelectedRow(0)
//            .setDoneButton(action: { (popover, selectedRow, selectedString) in
//                print("done row \(selectedRow) \(selectedString)")
//                self.serviceTxt.text! = selectedString
//            })
//            .setCancelButton(action: { (_, _, _) in print("cancel")}
//            )
//            .appear(originView: serviceTxt, baseViewController: self)
//
//
//
//        self.view.endEditing(true)
        StringPickerPopover(title: "", choices: ["Dog Walking","Dog Sitting","Cat Sitting", "Bird Sitting","Mouse Sitting", "Horse Sitting"])
            .setSelectedRow(2)
            .setDoneButton(action: { popover, selectedRow, selectedString in
                self.serviceTxt.text = selectedString
            })
            .appear(originView: serviceTxt, baseViewController: self)
    }
    
    // date and time tap
    @objc func dateTime(_ recognizer : UITapGestureRecognizer) {
        self.dateTime()
        self.view.endEditing(true)

    }
    
    // location tap
    @objc func location(_ recognizer : UITapGestureRecognizer) {
        
        self.view.endEditing(true)
        self.autoCompleteAddress()
    }
    
    // phone number tap
    @objc func phoneNumber(_ recognizer : UITapGestureRecognizer) {
        self.view.endEditing(true)
        
    }
    
    
  
    // MARK: - Navigation

    @IBAction func continueTapped(_ sender: Any) {
        ProgressHUD.show("Please wait...", interaction: false)

       if serviceTxt.text == ""  {
            let banner = StatusBarNotificationBanner(title: "Service Details missing! Please try again.", style: .danger)
            banner.show()
            
        ProgressHUD.dismiss()

            return
        }
        
        if  dateTimeTxt.text == "" {
            let banner = StatusBarNotificationBanner(title: "Date and time missing! Please try again.", style: .danger)
            banner.show()
            
            ProgressHUD.dismiss()

            return
        }
        
        if locationTxt.text == ""  {
            let banner = StatusBarNotificationBanner(title: "Address details missing! Please try again.", style: .danger)
            banner.show()
            
            ProgressHUD.dismiss()

            return
        }
        
        
//        if  phoneNumberTxt.text!.count <= 10 {
//            let banner = StatusBarNotificationBanner(title: "Contact number error! Please try again.", style: .danger)
//            banner.show()
//
//            ProgressHUD.dismiss()
//
//            return
//        }
        
        
        

    }
    
    
    
    @IBAction func servicesTapped(_ sender: CustomizableTextfield) {
        
        StringPickerPopover(title: "Select one", choices: ["Dog Walking","Dog Sitting","Cat Sitting", "Bird Sitting","Mouse Sitting", "Horse Sitting"])
            .setDoneButton(action: { popover, selectedRow, selectedString in
                sender.text = selectedString
            })
            .appear(originView: sender, baseViewController: self)
        
    }
    
    
    //MARK: Functions
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.animateTextField( up: true)
        self.screenLbl.isHidden = true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.animateTextField( up: false)
        self.screenLbl.isHidden = false

        if locationTxt.text != "" && serviceTxt.text != "" && dateTimeTxt.text != ""{
            continueBtn.isEnabled = true
        }
       
    }

    
    func animateTextField( up: Bool) {
        let movementDistance = 25
        let movementDuration = 0.3
        let movement = up ? -movementDistance : movementDistance
        UIView.beginAnimations("anim", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: CGFloat(movement))
        UIView.commitAnimations()
    }
    
    
    func autoCompleteAddress() {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        // Set a filter to return only addresses.
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autocompleteController.autocompleteFilter = filter
        
        present(autocompleteController, animated: true, completion: nil)
    }
    
    
    func dateTime() {
        let min = Date().addingTimeInterval(-10 * 60 * 24 * 4)
        let max = Date().addingTimeInterval(4090 * 60 * 24 * 4)
        let picker = DateTimePicker.show(selected: Date(), minimumDate: min, maximumDate: max)
        picker.timeInterval = DateTimePicker.MinuteInterval.thirty
        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.darkColor = UIColor.darkGray
        picker.doneButtonTitle = " DONE"
        picker.doneBackgroundColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.locale = Locale(identifier: "en_GB")
        
        picker.todayButtonTitle = "Today"
        picker.is12HourFormat = true
        picker.dateFormat = "hh:mm aa dd/MM/YYYY"
        //        picker.isTimePickerOnly = true
        picker.includeMonth = true // if true the month shows at top
        picker.completionHandler = { date in
            let formatter = DateFormatter()
            formatter.dateStyle = DateFormatter.Style.full
            formatter.dateFormat = "dd MMM ,  h:mm aa"
            self.title = formatter.string(from: date)
            self.dateTimeTxt.text = self.title!
            print(self.title!)
            let tm = self.title!.components(separatedBy: ",").last!
            let trimmed = tm.trimmingCharacters(in: .whitespacesAndNewlines)
            self.time = trimmed
            print("DEV: \(self.time!)")
            
            let dt = self.title!.prefix(2)
            self.day = "\(dt)"
            print("DEV: \(self.day!)")
            
            let mt = self.title!.components(separatedBy: ",").first!
            let nt = mt.dropFirst(3)
            let trimmedd = nt.trimmingCharacters(in: .whitespacesAndNewlines)
            self.month = "\(trimmedd)"
            print("DEV: \(self.month!.uppercased())")
            
            
        }
        picker.delegate = self
        self.picker = picker
    }
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        title = picker.selectedDateString
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.serviceTask = self.serviceTxt.text!
        print("DEV: \(self.serviceTask!)")
        
        if day != nil && month != nil && time != nil && serviceTask != nil && self.locationTxt.text != "" && self.phoneNumberTxt.text != "" {
            _day = day!
            _month = month!
            _time = time!
            _serviceTask = serviceTask!
            _address = self.locationTxt.text!
            _phone = self.phoneNumberTxt.text!}
            ProgressHUD.dismiss()
        
        
        }
    


}

extension AddServiceVC: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        // Print place info to the console.
//        print("Place name: \(place.name)")
//        print("Place address: \(place.formattedAddress)")
//        print("Place attributions: \(place.attributions)")
        
        // TODO: Add code to get address components from the selected place.
        self.locationTxt.text! = place.formattedAddress!
        // Close the autocomplete widget.
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Show the network activity indicator.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    // Hide the network activity indicator.
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}

extension UITextField{
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}
