//
//  User.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import Foundation
import Firebase

struct User {
    var identifier : String
    var nickname : String
    var consecutiveDay : Int
    var profileImage : String
    var gender : String
    
    struct notification {
        var Message : Bool
        var Feed : Bool
        
    }
}
