//
//  ViewController.swift
//  AmusementPark
//
//  Created by MacBook Air on 4/26/17.
//  Copyright © 2017 LionsEye. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    var guestType = String()
    
    let somePerson = Employee(type: .manager, firstName: "John", lastName: "Jenkins", address: "", city: "Toledo", state:          "OH", zipCode: 43061, birthday: "10/27/1988")
    
    let anotherPerson = Guest(type: .freeChildGuest, firstName: "Timmy", lastName: "Timkins", address: "4565 South Timmy St", city: "Paris", state: "OH", zipCode: 43061, birthday: "1/15/2005")
    
    
    @IBOutlet weak var typeInput: UITextField!
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var addressInput: UITextField!
    @IBOutlet weak var cityInput: UITextField!
    @IBOutlet weak var stateInput: UITextField!
    @IBOutlet weak var zipCodeInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var createPassBtn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Test Value #1 ... Manager with a missing address
//

        
//        guestType = somePerson.type.rawValue
//        firstNameInput.text = somePerson.firstName
//        lastNameInput.text = somePerson.lastName
        
        
        // Test Value #2 ... Classic Guest with a missing state
        

        guestType = anotherPerson.type.rawValue
        firstNameInput.text = anotherPerson.firstName
        lastNameInput.text = anotherPerson.lastName
        addressInput.text = anotherPerson.address
        cityInput.text = anotherPerson.city
        stateInput.text = anotherPerson.state
        zipCodeInput.text = "\(anotherPerson.zipCode)"
        ageInput.text = "\(anotherPerson.birthday)"
        
    }
    
    
    @IBAction func createPass(_ sender: Any) {
        
        let firstName = firstNameInput.text
        
        if guestType == GuestType.hourlyRide.rawValue || guestType == GuestType.hourlyFood.rawValue || guestType == GuestType.hourlyMaintenance.rawValue || guestType == GuestType.manager.rawValue {
        
        guard firstName != "" else {
            let alert = UIAlertController(title: "Missing Fields", message: "You have not entered a valid first name.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        
        guard lastNameInput.text != "" else {
            let alert = UIAlertController(title: "Missing Fields", message: "You have not entered a valid last name.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        
        guard addressInput.text != "" else {
            let alert = UIAlertController(title: "Missing Fields", message: "You have not entered a valid address.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        
        guard cityInput.text != "" else {
            let alert = UIAlertController(title: "Missing Fields", message: "You have not entered a valid city.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        
        guard stateInput.text != "" else {
            let alert = UIAlertController(title: "Missing Fields", message: "You have not entered a valid state.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        
        guard zipCodeInput.text != "" else {
            let alert = UIAlertController(title: "Missing Fields", message: "You have not entered a valid zip code.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        
        guard ageInput.text != "" else {
            let alert = UIAlertController(title: "Missing Fields", message: "You have not entered a valid age.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }

        print("BRIAN: Pass has been created!")
            
            let myVC = storyboard?.instantiateViewController(withIdentifier: "PassGenerator") as! PassGenerator
            myVC.passEmployee = somePerson
            navigationController?.pushViewController(myVC, animated: true)
            
        } else {
            
            let myVC = storyboard?.instantiateViewController(withIdentifier: "PassGenerator") as! PassGenerator
            myVC.passGuest = anotherPerson
            navigationController?.pushViewController(myVC, animated: true)
            
            }
        }
    }
