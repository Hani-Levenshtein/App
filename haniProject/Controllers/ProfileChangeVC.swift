//
//  ProfileChangeVC.swift
//  haniProject
//
//  Created by Hani on 2021/05/02.
//

import UIKit

class ProfileChangeVC: UIViewController {
    
    private let nicknameField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont.systemFont(ofSize: 20.0)
        textField.backgroundColor = .white
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        view.addSubview(nicknameField)
        
        nicknameField.translatesAutoresizingMaskIntoConstraints = false
        
        nicknameField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nicknameField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        nicknameField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
