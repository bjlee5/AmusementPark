//
//  GuestType.swift
//  AmusementPark
//
//  Created by MacBook Air on 4/28/17.
//  Copyright © 2017 LionsEye. All rights reserved.
//

import Foundation
import UIKit


enum GuestType: String {
    case classicGuest = "Classic Guest"
    case vipGuest = "VIP Guest"
    case freeChildGuest = "Free Child Guest"
    case hourlyFood = "Hourly Kitchen Employee"
    case hourlyRide = "Hourly Ride Employee"
    case hourlyMaintenance = "Hourly Maintenance Employee"
    case manager = "Manager"
}

extension GuestType {
    var foodDiscount: Int {
        switch self {
        case .classicGuest: return 0
        case .vipGuest: return 10
        case .freeChildGuest: return 0
        case .hourlyFood: return 15
        case .hourlyRide: return 15
        case .hourlyMaintenance: return 15
        case .manager: return 25
        }
    }
    
    var merchDiscount: Int {
        switch self {
        case .classicGuest: return 0
        case .vipGuest: return 20
        case .freeChildGuest: return 0
        case .hourlyFood: return 25
        case .hourlyRide: return 25
        case .hourlyMaintenance: return 25
        case .manager: return 25
        }
    }
    
    var kitchenAccess: Bool {
        switch self {
        case .classicGuest: return false
        case .vipGuest: return false
        case .freeChildGuest: return false
        case .hourlyFood: return true
        case .hourlyRide: return false
        case .hourlyMaintenance: return true
        case .manager: return true
        }
    }
    
    var rideControlAccess: Bool {
        switch self {
        case .classicGuest: return false
        case .vipGuest: return false
        case .freeChildGuest: return false
        case .hourlyFood: return false
        case .hourlyRide: return true
        case .hourlyMaintenance: return true
        case .manager: return true
        }
    }
    
    var maintenanceAccess: Bool {
        switch self {
        case .classicGuest: return false
        case .vipGuest: return false
        case .freeChildGuest: return false
        case .hourlyFood: return false
        case .hourlyRide: return false
        case .hourlyMaintenance: return true
        case .manager: return true
            
        }
    }
    
    var officeAccess: Bool {
        switch self {
        case .classicGuest: return false
        case .vipGuest: return false
        case .freeChildGuest: return false
        case .hourlyFood: return false
        case .hourlyRide: return false
        case .hourlyMaintenance: return false
        case .manager: return true
            
        }
    }
}


class Person {
    var type: GuestType
    var amusementAccess: Bool = true
    var rideAccess: Bool = true
    
    init(type: GuestType) {
        self.type = type
    }
}

class Guest: Person {
    
    // Personal Information
    var firstName: String?
    var lastName: String?
    var address: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    var birthday: String?
    
    init(type: GuestType, firstName: String, lastName: String, address: String, city: String, state: String, zipCode: Int, birthday: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.birthday = birthday
        
        super.init(type: type)
        
    }
}

class Employee: Person {
    
    // Personal Information
    var firstName: String
    var lastName: String
    var address: String
    var city: String
    var state: String
    var zipCode: Int
    var birthday: String
    
    init(type: GuestType, firstName: String, lastName: String, address: String, city: String, state: String, zipCode: Int, birthday: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.birthday = birthday
        
        super.init(type: type)
        
    }
}
