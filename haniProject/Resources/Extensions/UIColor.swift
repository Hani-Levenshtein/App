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
        return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
  }
}
