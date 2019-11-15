//
//  EditContactViewController.swift
//  mad2week4
//
//  Created by MAD2_P03 on 15/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import UIKit



class EditContactViewController: UIViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var EditFirstName: UITextField!
    @IBOutlet weak var EditLastName: UITextField!
    @IBOutlet weak var EditNumber: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func BtnEdit(_ sender: Any) {
        var index = appDelegate.index
        let contact = appDelegate.contactList[index!]
        contact.firstName = EditFirstName.text!
        contact.lastName = EditLastName.text!
        contact.mobileNo = EditNumber.text!
        
    }
    
}




