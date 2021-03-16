//
//  Group.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import Foundation
import Firebase

struct Chat {
    var identifier :String
    var title : String
    var numberOfPeople : Int
    var master : String
    var lastSentBy : String
    var lastSentAt : Timestamp //(date: Date())
    
    
}
