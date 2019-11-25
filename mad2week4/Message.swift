//
//  Contact.swift
//  mad2week4
//
//  Created by MAD2_P03 on 14/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import UIKit




class Message{

    var Date:Date
    var IsSender:Bool
    var Text:String
    
    
    init(date:Date, issender:Bool, text:String ) {
        Date = date
        IsSender = issender
       Text = text
    }
    
}
