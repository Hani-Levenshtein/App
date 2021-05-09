//
//  GraphVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
class GraphVC: UIViewController {
    
    let firstView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let secondView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let thirdView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .magenta
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
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
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.addArrangedSubview(thirdView)
        stackView.addArrangedSubview(fourthView)
        
          autoLayout()
    }
    private func autoLayout(){
        NSLayoutConstraint.activate([
            
            firstView.heightAnchor.constraint(equalToConstant: 50),
            firstView.widthAnchor.constraint(equalToConstant: 100),
            secondView.heightAnchor.constraint(equalToConstant: 100),
            secondView.widthAnchor.constraint(equalToConstant: 30),
            thirdView.heightAnchor.constraint(equalToConstant: 80),
            thirdView.widthAnchor.constraint(equalToConstant: 80),
            fourthView.heightAnchor.constraint(equalToConstant: 60),
            fourthView.widthAnchor.constraint(equalToConstant: 60),
            
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: view.frame.height-300),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
          
         
            ])
    }
}

