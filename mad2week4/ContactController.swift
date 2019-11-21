//
//  ContactController.swift
//  mad2week4
//
//  Created by MAD2_P03 on 21/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ContactController{
    
    
    //add a new contact to core data
    func AddContact(newContact:Contact)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        let person = NSManagedObject(entity: entity, insertInto: context)
        person.setValue(newContact.firstName, forKey: "firstname")
        person.setValue(newContact.lastName, forKey: "lastname")
        person.setValue(newContact.mobileNo, forKey: "mobileno")
        
        do{
            try context.save()
        }
        
        catch let error as NSError{
            print("could not save. \(error), \(error.userInfo)")
        }
    }
    
    //retrieve all contacts from core data
    func retrieveALLContact()->[Contact]
    {
       
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var contact: [NSManagedObject] = []
        var contactList: [Contact] = []
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        
        do {
            contact = try context.fetch(fetchRequest)
            
            for p in contact
            {
                let firstname = p.value(forKeyPath: "firstname") as? String
                let lastname = p.value(forKeyPath: "lastname") as? String
                let mobileno = p.value(forKeyPath: "mobileno") as? String

                
                contactList.append(Contact(firstname: firstname!, lastname: lastname!, mobileno:  mobileno!))
                print ("\(firstname!) \(lastname!), \(mobileno!)")
            }
        }
        
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return contactList
    }
    
    
    //update current contact with new contact
    //fetch data based on mobileno
    func updateContact(mobileno:String, newContact:Contact)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var contact:[NSManagedObject] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        
        
        do {
            contact = try context.fetch(fetchRequest)
            
            for c in contact{
                if (c.value(forKey: mobileno) as? String == mobileno){
                    
                    c.setValue(newContact.firstName, forKey: "firstname")
                    c.setValue(newContact.lastName, forKey: "lastname")
                    c.setValue(newContact.mobileNo, forKey: "mobileno")
                }
            }
            
        }catch let error as NSError{
            print ("Could not fetch. \(error), \(error.userInfo)")
        }
        do{
            try context.save()
        }
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    
    //delete contact by fetching data based on mobileno
    func deleteContact(mobileno:String)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var contact:[NSManagedObject] = []
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        
        do {
            contact = try context.fetch(fetchRequest)
            
            for c in contact{
                if (c.value(forKey: "mobileno") as? String == mobileno)
                {
                    context.delete(c)
                }
            }
        }
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        do{
            try context.save()
        }
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
        
        
    
}
