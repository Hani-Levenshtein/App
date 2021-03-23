//
//  RoutineVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
class RoutineVC : UIViewController{
    private let gradientLayer: CAGradientLayer = {
       let gradient = CAGradientLayer()
       gradient.borderWidth = CGFloat(0.5)
       gradient.borderColor = UIColor.black.cgColor
       gradient.colors = [UIColor.black.cgColor, UIColor.white.cgColor]
       gradient.startPoint = CGPoint(x: 0, y: 0)
       gradient.endPoint = CGPoint(x: 1, y: 0)
       gradient.type = .axial
       return gradient
     }()
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
         self.view.layer.addSublayer(gradientLayer)
    }
    
}
