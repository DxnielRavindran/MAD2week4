//
//  ShowContactViewController.swift
//  mad2week4
//
//  Created by MAD2_P03 on 14/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import UIKit


class ShowContactViewController : UITableViewController {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let controller = ContactController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    //method for writing number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //method for writing rows of table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (controller.retrieveALLContact().count)
    }
    
    //method to populate 
    override func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = (controller.retrieveALLContact()[indexPath.row])
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        return cell
    }
    
    //method to slide and delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
           
            appDelegate.contactList.remove(at: indexPath.row)
            
            controller.deleteContact(mobileno: controller.retrieveALLContact()[indexPath.row].mobileNo)
            
            
            // Reload TableView
            self.tableView.reloadData()
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        appDelegate.index = indexPath.row
    }
}
