//
//  Person.swift
//  haniProject
//
//  Created by Hani on 2021/05/17.
//

import Foundation

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Hani Levenshtein")

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

reference3 = nil
// Prints "John Appleseed is being deinitialized"
