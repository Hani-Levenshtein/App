//
//  EmailSignUpVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/09.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class EmailSignUpVC : UIViewController {
    
    let db = Firestore.firestore()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView :  UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        field.placeholder = "8자 이상 Password"
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
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Email Register"
        view.backgroundColor = .white
        
        emailField.delegate = self
        passwordField.delegate = self

        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = view.frame.size.width/3
        imageView.frame = CGRect(x: (view.frame.size.width-size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        emailField.frame = CGRect(x: 30,
                                  y: imageView.bottom+10,
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
        
        scrollView.isUserInteractionEnabled = true
    }
    
    @objc private func registerButtonTapped() {
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text,
              let password = passwordField.text
              else {return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error as NSError? {
               switch AuthErrorCode(rawValue: error.code) {
               case .operationNotAllowed:
                print("Error: 사용자 인증 정보가 나타내는 ID 공급업체 계정이 사용 설정되어 있지 않음을 나타냅니다. Firebase Console의 인증 섹션에서 사용 설정하세요.")
               case .emailAlreadyInUse:
                print("Error: 사용자 인증 정보에 담긴 이메일 주소를 기존 계정이 이미 사용 중이므로 이 로그인 방법으로 인증할 수 없음을 나타냅니다.")
               case .invalidEmail:
                print("Error: The email address is badly formatted.")
               case .weakPassword:
                print("Error: The password must be 6 characters long or more.")
               default:
                print("Error: \(error.localizedDescription)")
                
                //뷰컨 변경
                print("Error : EmailSignUpVC : registerButtonTapped")
                self.dismiss(animated:true)

               }
             } else {
               print("User signs up successfully")
                
                let userRef = self.db.collection("Users").document()
                
                //self : Reference to property 'db' in closure requires explicit use of 'self' to make capture semantics explicit
                //self는 사용자가 의도를 명시 or 강한참조순환이 발생할 가능성이 없을때 암시적 사용을 허가함
                
                userRef.setData([
                "identifier" : userRef,
                "name" : NSNull(),
                "consecutiveDay" : 0,
                "profileImage" : NSNull(),
                "notification" : false,
                "gender" : "Non-disclosure",
              
                ])

                let vc = TabBarVC()
                vc.selectedIndex = 2
                    // This is to get the SceneDelegate object from your view controller
                    // then call the change root view controller function to change to main tab bar
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc)
    
             }
        }
    }
}
        /*
         SignInVC
         Auth.auth().signIn(withEmail: self.usernameTextField.text!, password: self.passwordTextField.text!) {(user, error) in
                 if user != nil {
                     print("User Has Sign In")
                 }
                 if error != nil {
                     print(":(",error)
                 }
         }
         */



extension EmailSignUpVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            registerButtonTapped()
        }
        
        return true
    }
}
