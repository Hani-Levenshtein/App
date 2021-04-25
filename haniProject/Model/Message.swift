//
//  Message.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import Foundation
import Firebase

struct Message {
    var identifier : String
    var type : String
    var sentAt : Timestamp
    var sentBy : String
    var senderID: String
    var content : String
        
    
}
