//
//  AddContactViewController.swift
//  mad2week4
//
//  Created by MAD2_P03 on 14/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import UIKit




class AddFriendViewController: UIViewController {


    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    
    
    @IBAction func createBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        print(String(appDelegate.contactList.count))
        
        let oldcount:Int = appDelegate.contactList.count
        
        
        let newContact = Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno:  mobileFld.text!)
        appDelegate.contactList.append(newContact)
        
          if (appDelegate.contactList.count == oldcount + 1)
          {
            print("added")
            firstNameFld.text = ""
            lastNameFld.text = ""
            mobileFld.text = ""
        }
       
        
    }
    
}
