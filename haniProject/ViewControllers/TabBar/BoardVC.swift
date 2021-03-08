//
//  BoardVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
class BoardVC : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
    
        let navBar = UINavigationBar()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .red
        self.view.addSubview(navBar)
    
    }
    
}
