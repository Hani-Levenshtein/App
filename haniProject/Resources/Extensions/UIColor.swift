//
//  UIColor.swift
//  haniProject
//
//  Created by Hani on 2021/03/15.
//

import UIKit

enum Colors {
    
  case pastelPink

}
extension UIColor {
    
  static func appColor(_ name: Colors) -> UIColor {
    
    switch name {
    
    case .pastelPink:
        return #colorLiteral(red: 0.9036344886, green: 0.5387603641, blue: 0.5141199231, alpha: 1)
    }
  }
}

extension UIColor {

    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
          assert(0 <= red && red <= 255, "Invalid red component")
          assert(0 <= green && green <= 255, "Invalid green component")
          assert(0 <= blue && blue <= 255, "Invalid blue component")
          self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
      }
    
    convenience init(hex:Int, alpha: CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
    
    
}
