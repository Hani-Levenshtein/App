//
//  RegisterVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/08.
//

import UIKit
class RegisterVC: UIViewController {

    private let scrollerView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView :  UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        return imageView
    }()
    
    private let firstName : UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.placeholder = "firstNAme address"
        return field
    }()
    private let lastName : UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.placeholder = "lastName"
        return field
    }()
    private let emailField : UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.placeholder = "Email address"
        return field
    }()
    
    private let passwordField : UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.placeholder = "password"
        field.isSecureTextEntry = true
        return field
    }()
    
    private let RegisterButton : UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight : .bold)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log in "
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        RegisterButton.addTarget(self, action: #selector(registerButtonTapper), for: .touchUpInside)
        emailField.delegate=self
        passwordField.delegate=self
       scrollerView.addSubview(scrollerView)
        scrollerView.addSubview(imageView)
        scrollerView.addSubview(firstName)
        scrollerView.addSubview(lastName)
        scrollerView.addSubview(emailField)
        scrollerView.addSubview(passwordField)
        scrollerView.addSubview(RegisterButton)
        
        imageView.isUserInteractionEnabled = true
        scrollerView.isUserInteractionEnabled = true
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        //gesture.numberOfTouchesRequired = 1
        imageView.addGestureRecognizer(gesture)
    }
    
    @objc private func didTapChangeProfilePic() {
        presentPhotoActionSheet()
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollerView.frame = view.bounds
        
        let size = view.frame.size.width/3
        imageView.frame = CGRect(x: (view.frame.size.width-size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        imageView.layer.cornerRadius = imageView.width/2.0
        
        firstName.frame = CGRect(x: 30,
                                  y: imageView.bottom+10,
                                  width: scrollerView.width-60,
                                 height: 50)
        lastName.frame = CGRect(x: 30,
                                  y: firstName.bottom+10,
                                  width: scrollerView.width-60,
                                 height: 50)
        emailField.frame = CGRect(x: 30,
                                  y: lastName.bottom+10,
                                  width: scrollerView.width-60,
                                 height: 50)
        passwordField.frame = CGRect(x: 30,
                                 y: emailField.bottom+10,
                                 width: scrollerView.width-60,
                                 height: 50)
        
        RegisterButton.frame = CGRect(x: 30,
                                 y: passwordField.bottom+10,
                                 width: scrollerView.width-60,
                                 height: 50)
    }
    
    @objc private func registerButtonTapper() {
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        guard let firstName = firstName.text,
              let lastName = lastName.text,
              let email = emailField.text,
              let password = passwordField.text,
              !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty, password.count>=6 else {
            alertUserRegisterError()
            return
        }
    }
    
    func alertUserRegisterError() {
        let alert = UIAlertController(title: "woops", message: "please write all info", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert,animated: true)
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterVC()
        vc.title = "create acc"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension RegisterVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            registerButtonTapper()
        }
        return true
    }
    
}

extension RegisterVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "prifile pic", message: "what you choose", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "take photo", style: .default, handler: {[weak self]_ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "choose photo", style: .cancel, handler: {[weak self]_ in
                                                self?.presentPhotoPicker()}))
        
        present(actionSheet,animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
 
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
            return
        }
        self.imageView.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
