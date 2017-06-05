//
//  ViewController.swift
//  AmusementPark
//
//  Created by MacBook Air on 4/26/17.
//  Copyright © 2017 LionsEye. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var guestType = String()
    var type: GuestType!
    var firstName = String()
    var lastName = String()
    var address = String()
    var city = String()
    var state = String()
    var zipCode = String()
    var birthday = String()
    var entryDate = String()
    var company = String()
    var project = String()
    var personToPass: Person!
    var projectArray = ["1001", "1002", "1003", "2001", "2002"]
    var companyArray = ["Acme", "Orkin", "FedEx", "NW Electrical"]
    
    // Text Fields
    
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var addressInput: UITextField!
    @IBOutlet weak var cityInput: UITextField!
    @IBOutlet weak var stateInput: UITextField!
    @IBOutlet weak var zipCodeInput: UITextField!
    @IBOutlet weak var createPassBtn: UIButton!
    @IBOutlet weak var birthdayInput: UITextField!
    @IBOutlet weak var entryDateInput: UITextField!
    @IBOutlet weak var projectInput: UITextField!
    @IBOutlet weak var companyInput: UITextField!
    @IBOutlet weak var projectPicker: UIPickerView!
    @IBOutlet weak var companyPicker: UIPickerView!
    
    // Buttons 
    
    @IBOutlet weak var guestStackView: UIStackView!
    @IBOutlet weak var employeeStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        type = nil
        firstNameInput.text = ""
        lastNameInput.text = ""
        addressInput.text = ""
        cityInput.text = ""
        stateInput.text = ""
        zipCodeInput.text = ""
        birthdayInput.text = ""
        entryDateInput.text = ""
        projectInput.text = ""
        companyInput.text = ""
        
        
        guestStackView.isHidden = true
        employeeStackView.isHidden = true
        
        projectPicker.delegate = self
        projectPicker.dataSource = self
        projectPicker.isHidden = true
        
        companyPicker.delegate = self
        companyPicker.dataSource = self
        companyPicker.isHidden = true
    
    }
    
    // MARK: - Required Fields - determines which fields to disable/gray out based up GuestType selection
    
    func requiredFields() {
        
    
    if type == GuestType.classicGuest || type == GuestType.vipGuest {
        disabled(field: firstNameInput)
        disabled(field: lastNameInput)
        disabled(field: addressInput)
        disabled(field: cityInput)
        disabled(field: stateInput)
        disabled(field: zipCodeInput)
        disabled(field: birthdayInput)
        disabled(field: entryDateInput)
        disabled(field: projectInput)
        disabled(field: companyInput)
        
        projectPicker.isHidden = true
        companyPicker.isHidden = true
            
            
        } else if type == GuestType.hourlyFood || type == GuestType.hourlyRide || type == GuestType.hourlyMaintenance || type == GuestType.manager || type == GuestType.seasonPassGuest {
            
            enabled(field: firstNameInput)
            enabled(field: lastNameInput)
            enabled(field: addressInput)
            enabled(field: cityInput)
            enabled(field: stateInput)
            enabled(field: zipCodeInput)
            disabled(field: birthdayInput)
            disabled(field: entryDateInput)
            disabled(field: projectInput)
            disabled(field: companyInput)
        
            projectPicker.isHidden = true
            companyPicker.isHidden = true
        
        } else if type == GuestType.seniorGuest {
        
        enabled(field: firstNameInput)
        enabled(field: lastNameInput)
        enabled(field: birthdayInput)
        disabled(field: addressInput)
        disabled(field: cityInput)
        disabled(field: stateInput)
        disabled(field: zipCodeInput)
        disabled(field: entryDateInput)
        disabled(field: projectInput)
        disabled(field: companyInput)
        projectPicker.isHidden = true
        companyPicker.isHidden = true
        
    } else if type == GuestType.contract1001 || type == GuestType.contract1002 || type == GuestType.contract1003 || type == GuestType.contract2001 || type == GuestType.contract2002 {
        
        enabled(field: firstNameInput)
        enabled(field: lastNameInput)
        enabled(field: addressInput)
        enabled(field: cityInput)
        enabled(field: stateInput)
        enabled(field: zipCodeInput)
        enabled(field: birthdayInput)
        enabled(field: entryDateInput)
        enabled(field: projectInput)
        disabled(field: companyInput)
        projectPicker.isHidden = false
        companyPicker.isHidden = true
        
    } else if type == GuestType.vendorAcme || type == GuestType.vendorOrkin || type == GuestType.vendorFedex || type == GuestType.vendorNWElectric {
        
        enabled(field: firstNameInput)
        enabled(field: lastNameInput)
        enabled(field: birthdayInput)
        disabled(field: addressInput)
        disabled(field: cityInput)
        disabled(field: stateInput)
        disabled(field: zipCodeInput)
        enabled(field: entryDateInput)
        disabled(field: projectInput)
        enabled(field: companyInput)
        projectPicker.isHidden = true
        companyPicker.isHidden = false
        
    } else if type == GuestType.freeChildGuest {
        
        disabled(field: firstNameInput)
        disabled(field: lastNameInput)
        disabled(field: addressInput)
        disabled(field: cityInput)
        disabled(field: stateInput)
        disabled(field: zipCodeInput)
        enabled(field: birthdayInput)
        disabled(field: entryDateInput)
        disabled(field: projectInput)
        disabled(field: companyInput)
        
        projectPicker.isHidden = true
        companyPicker.isHidden = true
        
        }
    }
    
    // Methods for Disabling & Enabling TextFields
    
    func disabled(field: UITextField) {
        field.isEnabled = false
        field.backgroundColor = UIColor.gray
        field.text = ""
    }
    
    func enabled(field: UITextField) {
        field.isEnabled = true
        field.backgroundColor = UIColor.white
    }
    
    // MARK: - PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == projectPicker {
            return projectArray.count
        } else {
        return companyArray.count
    }
}
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == projectPicker {
            return projectArray[row]
        } else {
        return companyArray[row]
    }
}
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == projectPicker {
        projectInput.text = projectArray[row]
    } else {
        companyInput.text = companyArray[row]
        
        }
    }
    
    func contracterGuestType() {
        if projectInput.text == "1001" {
            type = GuestType.contract1001
        } else if projectInput.text  == "1002" {
            type = GuestType.contract1002
        } else if projectInput.text == "1003" {
            type = GuestType.contract1003
        } else if projectInput.text == "2001" {
            type = GuestType.contract2001
        } else if projectInput.text == "2002" {
            type = GuestType.contract2002
        }
    }
    
    func vendorGuestType() {
        if companyInput.text == "Acme" {
            type = GuestType.vendorAcme
        } else if companyInput.text == "Orkin" {
            type = GuestType.vendorOrkin
        } else if companyInput.text == "FedEx" {
            type = GuestType.vendorFedex
        } else if companyInput.text == "NW Electrical" {
            type = GuestType.vendorNWElectric
        }
    }
    
    
    // MARK: - Actions
    
    // Top Level Buttons
    
    @IBAction func guestBtnPress(_ sender: Any) {
        // Show Classic Guest, VIP Guest, Free Child Guest, Senior Pass Guest, Senior Guest
        guestStackView.isHidden = false
        employeeStackView.isHidden = true

    }
    
    @IBAction func employeeBtnPress(_ sender: Any) {
        // Show Hourly Food Services, Hourly Ride Services, Hourly Maintenance, Contract Employee
        guestStackView.isHidden = true
        employeeStackView.isHidden = false
    }
    
    @IBAction func managerBtnPress(_ sender: Any) {
        // Proceed to questionairre
        guestStackView.isHidden = true
        employeeStackView.isHidden = true
        
        type = GuestType.manager
        requiredFields()
    }
    
    @IBAction func vendorBtnPress(_ sender: Any) {
        // Proceed to questionairre
        guestStackView.isHidden = true
        employeeStackView.isHidden = true
        companyPicker.isHidden = false
        
        enabled(field: firstNameInput)
        enabled(field: lastNameInput)
        enabled(field: birthdayInput)
        disabled(field: addressInput)
        disabled(field: cityInput)
        disabled(field: stateInput)
        disabled(field: zipCodeInput)
        enabled(field: entryDateInput)
        disabled(field: projectInput)
        enabled(field: companyInput)
        projectPicker.isHidden = true

    }
    
    // Guest Stack Buttons
    
    @IBAction func classicGuestPress(_ sender: Any) {

        type = GuestType.classicGuest
        requiredFields()
    }
    
    @IBAction func vipGuestPress(_ sender: Any) {
        
        type = GuestType.vipGuest
        requiredFields()
    }
    
    @IBAction func freeChildGuestPress(_ sender: Any) {
        
        type = GuestType.freeChildGuest
        requiredFields()
    }
    
    @IBAction func seniorPassPress(_ sender: Any) {
        
        type = GuestType.seasonPassGuest
        requiredFields()
    }
    
    @IBAction func seniorPress(_ sender: Any) {
        
        type = GuestType.seniorGuest
        requiredFields()
    }
    
    // Employee Stack Buttons 
    
    @IBAction func hourlyFreePress(_ sender: Any) {
        
        type = GuestType.hourlyFood
        requiredFields()
    }
    
    @IBAction func hourlyRidePress(_ sender: Any) {
        
        type = GuestType.hourlyRide
        requiredFields()
    }
    
    @IBAction func hourlyManPress(_ sender: Any) {
        
        type = GuestType.hourlyMaintenance
        requiredFields()
    }
    
    @IBAction func contractPress(_ sender: Any) {
        
        enabled(field: firstNameInput)
        enabled(field: lastNameInput)
        enabled(field: addressInput)
        enabled(field: cityInput)
        enabled(field: stateInput)
        enabled(field: zipCodeInput)
        disabled(field: birthdayInput)
        disabled(field: entryDateInput)
        enabled(field: projectInput)
        disabled(field: companyInput)
        projectPicker.isHidden = false
    }
    

    @IBAction func createPass(_ sender: Any) {
        
        contracterGuestType()
        vendorGuestType()
    
        firstName = firstNameInput.text!
        lastName = lastNameInput.text!
        address = addressInput.text!
        city = cityInput.text!
        state = stateInput.text!
        zipCode = zipCodeInput.text!
        entryDate = entryDateInput.text!
        birthday = birthdayInput.text!
        company = companyInput.text!
        project = projectInput.text!
        
        guard type != nil else {
            let alert = UIAlertController(title: "Missing Fields", message: "You have not selected a valid Guest Type!", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        
        if type == GuestType.hourlyFood || type == GuestType.hourlyRide || type == GuestType.hourlyMaintenance || type == GuestType.manager || type == GuestType.seasonPassGuest {
        
        alertFor(missing: firstName, message: "You have not entered a valid first name")
        alertFor(missing: lastName, message: "You have not entered a valid last name")
        alertFor(missing: address, message: "You have not entered a valid address")
        alertFor(missing: city, message: "You have not entered a valid city")
        alertFor(missing: state, message: "You have not entered a valid state")
        alertFor(missing: zipCode, message: "You have not entered a valid zip code")
            
        } else if type == GuestType.seniorGuest {
            
        alertFor(missing: firstName, message: "You have not entered a valid first name")
        alertFor(missing: lastName, message: "You have not entered a valid last name")
        alertFor(missing: birthday, message: "You have not entered a valid birthday")
            
        } else if type == GuestType.contract1001 || type == GuestType.contract1002 || type == GuestType.contract1003 || type == GuestType.contract2001 || type == GuestType.contract2002 {
            
            alertFor(missing: firstName, message: "You have not entered a valid first name")
            alertFor(missing: lastName, message: "You have not entered a valid last name")
            alertFor(missing: address, message: "You have not entered a valid address")
            alertFor(missing: city, message: "You have not entered a valid city")
            alertFor(missing: state, message: "You have not entered a valid state")
            alertFor(missing: zipCode, message: "You have not entered a valid zip code")
            alertFor(missing: project, message: "You have not selected a valid project")
            
        } else if type == GuestType.vendorAcme || type == GuestType.vendorOrkin || type == GuestType.vendorFedex || type == GuestType.vendorNWElectric {
        
            alertFor(missing: firstName, message: "You have not entered a valid first name")
            alertFor(missing: lastName, message: "You have not entered a valid last name")
            alertFor(missing: birthday, message: "You have not entered a valid birthday")
            alertFor(missing: company, message: "You have not entered a valid company")
            alertFor(missing: entryDate, message: "You have not entered a valid entry date")
        
            
        print("BRIAN: Pass has been created!")
        performSegue(withIdentifier: "CreatePass", sender: self)
            }
        }
    
    @IBAction func populatePass(_ sender: Any) {
        type = GuestType.hourlyRide
        requiredFields()
        
        firstNameInput.text = "Walter"
        lastNameInput.text = "White"
        addressInput.text = "1234 Main St"
        cityInput.text = "Austin"
        stateInput.text = "Texas"
        zipCodeInput.text = "45252"
        birthdayInput.text = ""
        entryDateInput.text = ""
        companyInput.text = ""
        projectInput.text = ""
    }
    
    // MARK: - Helper Methods
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreatePass" {
            print("BRIAN - Segway performed!!")
            let destinationViewController = segue.destination as! PassGenerator
            destinationViewController.passGuestType = type
            destinationViewController.passFirstName = firstName
            destinationViewController.passLastName = lastName 
        }
    }
    
    func alertFor(missing: String, message: String) {
        guard missing != "" else {
            let alert = UIAlertController(title: "Missing Fields", message: message, preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
    }

}

