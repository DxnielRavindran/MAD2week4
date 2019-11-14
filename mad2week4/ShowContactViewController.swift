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
        return appDelegate.contactList.count
    }
    
    //method to populate 
    override func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = appDelegate.contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            // Remove selected contact from contactList
            appDelegate.contactList.remove(at: indexPath.row)
            
            // Reload TableView
            self.tableView.reloadData()
        }
    }
}
