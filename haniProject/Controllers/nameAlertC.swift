//
//  nameAlertC.swift
//  haniProject
//
//  Created by Hani on 2021/03/21.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

protocol Vehicle {
    var direction: String {get set}
    func move(velocity: Self)
}

extension Vehicle {
    func move(velocity: Self) {
       print("Move at \(velocity)k/m to the \(direction)")
    }
    
}

struct Bicycle : Vehicle {
    var direction: String
}

struct Truck : Vehicle {
    var direction: String
}

/*

 */
func getDateFormat(from date: Date, to format: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: date)
}

































































