//
//  Group.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import Foundation
import Firebase

struct Room {
    var identifier: String
    var title: String
    var peopleCount: Int
    var master: String
    var lastSentBy: String
    var lastSentAt: Date
    var lastContent: String
    var userlist: [String]
    var profileImage : String
}
