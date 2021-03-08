//
//  AVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/08.
//

import UIKit
import FirebaseAuth

class AVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isLoggedin = UserDefaults.standard.bool(forKey:"logged_in")
        if !isLoggedin {
            let vc = LoginVC()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav,animated:true)
        }
        
        
    }
    
}
