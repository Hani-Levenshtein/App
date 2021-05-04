//
//  GraphVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
class GraphVC: UIViewController {
    
    let firstView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view.backgroundColor = .red
         return view
    }()
    
    let secondView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        view.backgroundColor = .cyan
        return view
    }()
    
    let thirdView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        view.backgroundColor = .magenta
        return view
    }()
    
    let fourthView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
        view.backgroundColor = .orange
        return view
    }()
    
    
    let stackView: UIStackView = {
        let stackView = UIStackView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = .none
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.backgroundColor = .white
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 1
        
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.addArrangedSubview(thirdView)
        stackView.addArrangedSubview(fourthView)
        stackView.bounds = stackView.frame
        autoLayout()
    }
    private func autoLayout(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo:stackView.topAnchor,constant: 350),
            stackView.trailingAnchor.constraint(equalTo:stackView.leadingAnchor,constant: 350),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
           
         
            ])
    }
}

