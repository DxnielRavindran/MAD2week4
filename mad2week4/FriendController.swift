//
//  FriendController.swift
//  mad2week4
//
//  Created by MAD2_P03 on 21/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class FriendController{
    
    
    
    func AddFriend(friend:Friend)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)!
        let newfriend = NSManagedObject(entity: entity, insertInto: context)
        
        newfriend.setValue(friend.Name, forKey: "name")
        newfriend.setValue(friend.ProfileImageName, forKey: "profileImageName")
        
        do{
            try context.save()
            print("Friend saved")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    
    func AddMessageToFriend(friend:Friend, message:Message)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDMessage", in: context)!
        let newmessage = NSManagedObject(entity: entity, insertInto: context)
        newmessage.setValue(message.Text, forKey: "text")
        newmessage.setValue(message.Date, forKey: "date")
        newmessage.setValue(message.IsSender, forKey: "isSender")
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.Name)
        do{
            let test = try context.fetch(fetchRequest)
            let cdfriend = test[0]
            newmessage.setValue(cdfriend, forKey: "friend")
            try context.save()
        } catch{
            print(error)
        }
    }
    
    
    
    func retrieveMessagesbyFriend(friend:Friend)->[Message]
    {
        var messageList:[Message] = []
    
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CDMessage>(entityName: "CDMessage")
        
        
        fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.Name)
        do{
            let messagelist:[NSManagedObject] = try context.fetch(fetchRequest)
            
            
            for m in messagelist{
                let d = m.value(forKey: "date") as? Date
                let b = m.value(forKey: "isSender") as? Bool
                let t = m.value(forKey: "text") as? String
                
                print("\(d!) \(b!) \(t!)")
                
                messageList.append(Message(date: d!, issender: b!, text: t!))
            }
        } catch{
            print(error)
        }
        
        return messageList
    }
}
