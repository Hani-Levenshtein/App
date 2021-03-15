//
//  EmailSignUpVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/09.
//

import UIKit
import FirebaseAuth

class EmailSignUpVC : UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()

    private let nameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "닉네임"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.isSecureTextEntry = true
        return field
    }()

    private let registerButton: UIButton = {
           let button = UIButton()
           button.setTitle("Register", for: .normal)
           button.backgroundColor = .systemGreen
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 12
           button.layer.masksToBounds = true
           button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
           return button
   }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            scrollView.frame = view.bounds

            let size = scrollView.width/3
           

        emailField.frame = CGRect(x: 30,
                                      y: 0,
                                      width: scrollView.width-60,
                                      height: 52)
        passwordField.frame = CGRect(x: 30,
                                      y: emailField.bottom+10,
                                      width: scrollView.width-60,
                                      height: 52)
        registerButton.frame = CGRect(x: 30,
                                      y: passwordField.bottom+10,
                                      width: scrollView.width-60,
                                      height: 52)

        }

}
