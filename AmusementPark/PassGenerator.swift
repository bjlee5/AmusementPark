//
//  PassGenerator.swift
//  AmusementPark
//
//  Created by MacBook Air on 4/30/17.
//  Copyright © 2017 LionsEye. All rights reserved.
//

import UIKit

class PassGenerator: UIViewController {
    
    var passGuestType: GuestType!
    var passFirstName: String = ""
    var passLastName: String = ""
    var passAddress = String()
    var passCity = String()
    var passState = String()
    var passZip = String()
    var passAge = String()
    var personPassed: Person!

    
    // Default values for Pass Guest
    
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var testResultsView: UIView!
    @IBOutlet weak var testResultsLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Guest Type - \(passGuestType)")
        
        typeLabel.text = passGuestType.rawValue
        firstNameLabel.text = passFirstName
        lastNameLabel.text = passLastName
        
        foodDiscountLabel.text = "•\(passGuestType.foodDiscount)% Food Discount"
        merchDiscountLabel.text = "•\(passGuestType.merchDiscount)% Merch Discount"
        
        personPassed = Person(type: passGuestType, firstName: passFirstName, lastName: passLastName, address: passAddress, city: passCity, state: passState, zipCode: passZip, birthday: passAge)
        
    }
    
    // MARK: - Access Functions 
    
    
    func amusementParkAccess(for guest: Person) {
        let accessLevel = guest.amusementAccess
        if accessLevel == true {
            print("Park Access granted!")
            testResultsView.backgroundColor = UIColor.green
            testResultsLabel.text = "Access Granted"
        } else {
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel.text = "Access Denied"
        }
    }
    
    func showRideAccess(for guest: Person) -> Bool {
        let rideAccess = guest.type.rideAccess
        print("Ride Access: \(rideAccess)")
        if rideAccess == true {
            testResultsView.backgroundColor = UIColor.green
            testResultsLabel.text = "Access Granted"
        } else {
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel.text = "Access Denied"
        }
        return rideAccess
    }
    
    func showFoodDiscount(for guest: Person) -> Int {
        let foodDiscount = guest.type.foodDiscount
        print("Food discount: \(foodDiscount)%")
        return foodDiscount
    }
    
    func showMerchDiscount(for guest: Person) -> Int {
        let merchDiscount = guest.type.merchDiscount
        print("Merchindise discount: \(merchDiscount)%")
        return merchDiscount
    }
    
    func showKitchenAccess(for guest: Person) -> Bool {
        let kitchenAccess = guest.type.kitchenAccess
        print("Kitchen Access: \(kitchenAccess)")
        if kitchenAccess == true {
            testResultsView.backgroundColor = UIColor.green
            testResultsLabel.text = "Access Granted"
        } else {
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel.text = "Access Denied"
        }
        return kitchenAccess
    }
    
    func showRideControlAccess(for guest: Person) -> Bool {
        let rideControlAccess = guest.type.rideControlAccess
        print("Ride Control Access: \(rideControlAccess)")
        if rideControlAccess == true {
            testResultsView.backgroundColor = UIColor.green
            testResultsLabel.text = "Access Granted"
        } else {
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel.text = "Access Denied"
        }
        return rideControlAccess
    }
    
    func showMaintenanceAccess(for guest: Person) -> Bool {
        let maintenanceAccess = guest.type.maintenanceAccess
        print("Maintenance Access: \(maintenanceAccess)")
        if maintenanceAccess == true {
            testResultsView.backgroundColor = UIColor.green
            testResultsLabel.text = "Access Granted"
        } else {
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel.text = "Access Denied"
        }
        return maintenanceAccess
    }
    
    func showofficeAccess(for guest: Person) -> Bool {
        let officeAccess = guest.type.officeAccess
        print("Office Access: \(officeAccess)")
        if officeAccess == true {
            testResultsView.backgroundColor = UIColor.green
            testResultsLabel.text = "Access Granted"
        } else {
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel.text = "Access Denied"
        }
        return officeAccess
    }
    
    func skipLinePrivledge(for guest: Person) -> Bool {
        let skipLines = guest.type.canSkipLines
        print("Office Access: \(skipLines)")
        if skipLines == true {
            testResultsView.backgroundColor = UIColor.green
            testResultsLabel.text = "Access Granted"
        } else {
            testResultsView.backgroundColor = UIColor.red
            testResultsLabel.text = "Access Denied"
        }
        return skipLines
    }

    
//    func swipePass(for guest: Person) {
//        amusementParkAccess(for: guest)
//        showFoodDiscount(for: guest)
//        showMerchDiscount(for: guest)
//        rideAccess(for: guest)
//        showKitchenAccess(for: guest)
//        showRideControlAccess(for: guest)
//        showMaintenanceAccess(for: guest)
//        showofficeAccess(for: guest)
//        
//    }
    
    // MARK: - Actions 
    
    @IBAction func amusementAccessTest(_ sender: Any) {
        amusementParkAccess(for: personPassed)
    }
    @IBAction func kitchenAccessTest(_ sender: Any) {
        showKitchenAccess(for: personPassed)
    }
    @IBAction func rideControlAccessTest(_ sender: Any) {
        showRideControlAccess(for: personPassed)
    }
    @IBAction func officeAccess(_ sender: Any) {
        showofficeAccess(for: personPassed)
    }
    @IBAction func maintenanceAccess(_ sender: Any) {
        showMaintenanceAccess(for: personPassed)
    }
    @IBAction func rideAccess(_ sender: Any) {
        showRideAccess(for: personPassed)
    }
    
    @IBAction func discountTotal(_ sender: Any) {
        testResultsLabel.text = "\(passGuestType.foodDiscount)% Food Discount & \(passGuestType.merchDiscount)% Merch Discount"
        testResultsView.backgroundColor = UIColor.lightGray
    }
    @IBAction func skipLines(_ sender: Any) {
        skipLinePrivledge(for: personPassed)
    }
    @IBAction func createNewPass(_ sender: Any) {
            performSegue(withIdentifier: "PassGenerator", sender: self)
    }

}
