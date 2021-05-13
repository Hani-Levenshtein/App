//
//  SecondVC.swift
//  haniProject
//
//  Created by Hani on 2021/05/12.
//

import UIKit
class SecondVC: UIViewController {
    
    let createFeedButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "flame.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor.appColor(.pastelPink)
        button.addTarget(self, action: #selector(searchFeedButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    let firstView: UILabel = {
        let view = UILabel()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.text = "2 Hani Levenshtein"
        view.textAlignment = .center
        return view
    }()

    let fourthView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.contentMode = .scaleAspectFit
        stackView.backgroundColor = .white
        stackView.autoresizesSubviews = true
        
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        stackView.distribution = .equalSpacing
        stackView.alignment = .firstBaseline
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2 viewDidLoad")
        view.backgroundColor = .white
        view.addSubview(stackView)
        view.addSubview(createFeedButton)
        stackView.addArrangedSubview(firstView)
        autoLayout()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("2 viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("2 viewDidAppear")
        print("***************")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("2 viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("2 viewDidDisappear")
    }
    

    private func autoLayout(){
        NSLayoutConstraint.activate([

            createFeedButton.heightAnchor.constraint(equalToConstant: 100),
            createFeedButton.widthAnchor.constraint(equalToConstant: 100),
            createFeedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createFeedButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
 
 
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           stackView.heightAnchor.constraint(equalToConstant: 100),
            
           stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
          
         
            ])
    }
    
    @objc private func searchFeedButtonTapped(_ sender: UIButton){
        self.dismiss(animated: true)
    }
}

