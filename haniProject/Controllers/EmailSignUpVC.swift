//
//  EmailSignUpVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/09.
//

import UIKit
import Firebase
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
        field.placeholder = "6자 이상 Password"
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
        
        Auth.auth().createUser(withEmail: email, password: password) { [self] (authResult, error)  in
            
            if error != nil {
            if let error : AuthErrorCode = AuthErrorCode(rawValue: error!._code) {
               switch error {
                   case .operationNotAllowed:
                    print("Error: 사용자 인증 정보가 나타내는 ID 공급업체 계정이 사용 설정되어 있지 않음을 나타냅니다. Firebase Console의 인증 섹션에서 사용 설정하세요.")
                   case .emailAlreadyInUse:
                    print("Error: 사용자 인증 정보에 담긴 이메일 주소를 기존 계정이 이미 사용 중이므로 이 로그인 방법으로 인증할 수 없음을 나타냅니다.")
                   case .invalidEmail:
                    print("Error: The email address is badly formatted.")
                   case .weakPassword:
                    print("Error: The password must be 6 characters long or more.")
                   default:
                    print("Error : other error")
                    }
                }
                self.dismiss(animated:true)

            } else {

                    let userID : String = (authResult?.user.uid)!
                    db.collection("users").document(userID).setData([
                    "identifier" : userID,
                    "nickname" : NSNull(),
                    "consecutiveDay" : 0,
                    "profileImage" : NSNull(),
                    "gender" : NSNull(),
                    "notification" : [
                        "message" : true,
                        "Feed" : true
                    ]
                    ])
                    
                    print("EmailSignUp Success")
                    
                    let vc = TabBarVC()
                    vc.modalPresentationStyle = .currentContext
                    vc.modalTransitionStyle = .coverVertical
                
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc)

             }
        }
    }
}
   
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
