//
//  PassGenerator.swift
//  AmusementPark
//
//  Created by MacBook Air on 4/30/17.
//  Copyright © 2017 LionsEye. All rights reserved.
//

import UIKit

class PassGenerator: UIViewController {
    
    var passType = String()
    var passFirstName = String()
    var passLastName = String()
    var passAddress = String()
    var passCity = String()
    var passState = String()
    var passZip = String()
    var passAge = String()
    
    // Default values for Pass Guest
    
    var passGuest = Guest(type: .classicGuest, firstName: "", lastName: "", address: "", city: "", state: "", zipCode: 00000, birthday: "")
    var passEmployee = Employee(type: .hourlyFood, firstName: "", lastName: "", address: "", city: "", state: "", zipCode: 00000, birthday: "")
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipePass(for: passGuest)
        
    }
    
    ///////// ACCESS FUNCTIONS //////////
    
    
    func amusementParkAccess(for guest: Person) {
        let accessLevel = guest.amusementAccess
        if accessLevel == true {
            print("Park Access granted!")
        }
    }
    
    func rideAccess(for guest: Person) {
        let accessLevel = guest.rideAccess
        if accessLevel == true {
            print("Ride Access granted!")
        }
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
            print("Kitchen Access granted!")
        } else {
            print("Kitchen Access denied!")
        }
        return kitchenAccess
    }
    
    func showRideControlAccess(for guest: Person) -> Bool {
        let rideControlAccess = guest.type.rideControlAccess
        print("Ride Control Access: \(rideControlAccess)")
        if rideControlAccess == true {
            print("Ride Control Access granted!")
        } else {
            print("Ride Control Access denied!")
        }
        return rideControlAccess
    }
    
    func showMaintenanceAccess(for guest: Person) -> Bool {
        let maintenanceAccess = guest.type.maintenanceAccess
        print("Maintenance Access: \(maintenanceAccess)")
        if maintenanceAccess == true {
            print("Maintenance Area Access granted!")
        } else {
            print("Maintenance Area Access denied!")
        }
        return maintenanceAccess
    }
    
    func showofficeAccess(for guest: Person) -> Bool {
        let officeAccess = guest.type.officeAccess
        print("Office Access: \(officeAccess)")
        if officeAccess == true {
            print("Office Access granted!")
        } else {
            print("Office Access denied!")
        }
        return officeAccess
    }
    
    func swipePass(for guest: Person) {
        amusementParkAccess(for: guest)
        showFoodDiscount(for: guest)
        showMerchDiscount(for: guest)
        rideAccess(for: guest)
        showKitchenAccess(for: guest)
        showRideControlAccess(for: guest)
        showMaintenanceAccess(for: guest)
        showofficeAccess(for: guest)
        
    }

}
