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
    case seasonPassGuest = "Senior Pass Guest"
    case seniorGuest = "Senior Guest"
    case contract1001, contract1002, contract1003, contract2001, contract2002 = "Contract Employee"
    case vendorAcme, vendorOrkin, vendorFedex, vendorNWElectric = "Vendor"
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
        case .seasonPassGuest: return 10
        case .seniorGuest: return 10
        case .contract1001, .contract1002,.contract1003, .contract2001, .contract2002: return 0
        case .vendorAcme, .vendorOrkin, .vendorFedex, .vendorNWElectric: return 0
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
        case .seasonPassGuest: return 20
        case .seniorGuest: return 10
        case .contract1001, .contract1002, .contract1003, .contract2001, .contract2002: return 0
        case .vendorAcme, .vendorOrkin, .vendorFedex, .vendorNWElectric: return 0
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
        case .seasonPassGuest: return false
        case .seniorGuest: return false
        case .contract1001: return false
        case .contract1002: return false
        case .contract1003: return true
        case .contract2001: return false
        case .contract2002: return true
        case .vendorAcme: return true
        case .vendorOrkin: return true
        case .vendorFedex: return false
        case .vendorNWElectric: return true
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
        case .seasonPassGuest: return false
        case .seniorGuest: return false
        case .contract1001: return true
        case .contract1002: return true
        case .contract1003: return true
        case .contract2001: return false
        case .contract2002: return false
        case .vendorAcme: return false
        case .vendorOrkin: return true
        case .vendorFedex: return false
        case .vendorNWElectric: return true
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
        case .seasonPassGuest: return false
        case .seniorGuest: return false
        case .contract1001: return false
        case .contract1002: return true
        case .contract1003: return true
        case .contract2001: return false
        case .contract2002: return true
        case .vendorAcme: return false
        case .vendorOrkin: return false
        case .vendorFedex: return true
        case .vendorNWElectric: return true
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
        case .seasonPassGuest: return false
        case .seniorGuest: return false
        case .contract1001: return false
        case .contract1002: return false
        case .contract1003: return true
        case .contract2001: return true
        case .contract2002: return false
        case .vendorAcme: return false
        case .vendorOrkin: return false
        case .vendorFedex: return true
        case .vendorNWElectric: return true
        }
    }
    
    
    var canSkipLines: Bool {
        switch self {
        case .classicGuest: return false
        case .vipGuest: return true
        case .freeChildGuest: return false
        case .hourlyFood: return false
        case .hourlyRide: return false
        case .hourlyMaintenance: return false
        case .manager: return false
        case .seasonPassGuest: return true
        case .seniorGuest: return true
        case .contract1001: return false
        case .contract1002: return false
        case .contract1003: return false
        case .contract2001: return false
        case .contract2002: return false
        case .vendorAcme: return false
        case .vendorOrkin: return false
        case .vendorFedex: return false
        case .vendorNWElectric: return false
        
        }
    }
    
    var rideAccess: Bool {
        switch self {
        case .classicGuest: return true
        case .vipGuest: return true
        case .freeChildGuest: return true
        case .hourlyFood: return true
        case .hourlyRide: return true
        case .hourlyMaintenance: return true
        case .manager: return true
        case .seasonPassGuest: return true
        case .seniorGuest: return true
        case .contract1001: return false
        case .contract1002: return false
        case .contract1003: return false
        case .contract2001: return false
        case .contract2002: return false
        case .vendorAcme: return false
        case .vendorOrkin: return false
        case .vendorFedex: return false
        case .vendorNWElectric: return false
        }
    }
}


class Person {
    
    // Personal Information
    var firstName: String?
    var lastName: String?
    var address: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var birthday: String?
    var type: GuestType
    var amusementAccess: Bool = true
    
    init(type: GuestType, firstName: String, lastName: String, address: String, city: String, state: String, zipCode: String, birthday: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.birthday = birthday
        self.type = type 

    }
}

