//
//  ProfileChangeVC.swift
//  haniProject
//
//  Created by Hani on 2021/05/02.
//

import UIKit

class ProfileChangeVC: UIViewController {
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        imageView.image = UIImage(systemName: "person.crop.circle.fill")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
        return imageView
    }()
    
    private let nicknameField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont.systemFont(ofSize: 20.0)
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .leading
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = . white
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
      
        addContentView()
        autoLayout()

    }
    
    private func addContentView(){
        
        view.addSubview(profileStackView)
        profileStackView.addSubview(profileImageView)
        profileStackView.addSubview(nicknameField)
    }

    private func autoLayout(){
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            nicknameField.heightAnchor.constraint(equalToConstant: 50),
            nicknameField.widthAnchor.constraint(equalToConstant: 200),
            profileStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            profileStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
