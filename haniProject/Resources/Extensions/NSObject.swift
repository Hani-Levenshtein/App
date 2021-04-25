//
//  NSObject.swift
//  haniProject
//
//  Created by Hani on 2021/04/05.
//

import Foundation

extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
