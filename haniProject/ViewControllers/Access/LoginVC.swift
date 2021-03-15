//
//  Login2VC.swift
//  haniProject
//
//  Created by Hani on 2021/03/09.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
//import GoogleSignIn
import FBSDKLoginKit

class LoginVC : UIViewController {


    private let scrollView : UIScrollView = {
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
    
    private let emailSignUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("이메일로 가입", for: .normal)
        button.setTitleColor(UIColor.appColor(.pastelPink), for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .thin)
        button.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        return button
    }()
    
    private let emailSignInButton : UIButton = {
        let button = UIButton()
        button.setTitle("이메일로 로그인", for: .normal)
        button.setTitleColor(UIColor.appColor(.pastelPink), for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleColor(for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .thin)
        return button
    }()
    
    //private let googleSignInButton =  GIDSignInButton()
    //private let facebookLoginButton = FBLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //GIDSignIn.sharedInstance()?.presentingViewController = self
        //GIDSignIn.sharedInstance().signIn()
        //googleSignInButton.style = .standard
        
        //facebookLoginButton.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailSignUpButton)
        scrollView.addSubview(emailSignInButton)
        //scrollerView.addSubview(googleSignInButton)
        //scrollerView.addSubview(facebookLoginButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        let size = view.frame.size.width/3
        imageView.frame = CGRect(x: (view.frame.size.width-size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        emailSignUpButton.frame = CGRect(x: 30,
                                  y: imageView.bottom+10,
                                  width: scrollView.width-60,
                                 height: 50)
        
        emailSignInButton.frame = CGRect(x: 30,
                                  y: emailSignUpButton.bottom+10,
                                  width: scrollView.width-60,
                                 height: 50)
        
        /*
        googleSignInButton.frame = CGRect(x: 30,
                                  y: imageView.bottom+10,
                                  width: scrollerView.width-60,
                                 height: 50)
        */
        
        /*
        facebookSignInButton.frame = CGRect(x: 30,
                                y: googleSignInButton.bottom+10,
                                  width: scrollerView.width-60,
                                height: 50)
        */
       
    }
    
    @objc private func didTapSignUp(sender: UIButton!) {
        let VC = EmailSignUpVC()
        self.present(VC, animated: false, completion: nil)
    }
}
