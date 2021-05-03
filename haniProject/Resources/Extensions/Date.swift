//
//  Date.swift
//  haniProject
//
//  Created by Hani on 2021/04/22.
//

import Foundation

extension Date {
    /// Returns a date from the provided string.
    ///
    /// - Parameter utcString: The string used to create the date.
    ///
    /// - Returns: A date from the provided string.
    ///
    static func utcDate(from utcString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "UTC")!
        return formatter.date(from: utcString)
    }
    
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)

         }
}
