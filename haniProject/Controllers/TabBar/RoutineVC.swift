//
//  RoutineVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
class RoutineVC : UIViewController{
    
    let textView: UITextView = {
        let view = UITextView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        view.text = "Hani Levenshtein\niOS Developer"
        
     
        
        let subView = UITextView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        subView.backgroundColor = .systemBlue
        subView.layer.shadowColor = UIColor.black.cgColor
        subView.layer.shadowRadius = 20
        view.backgroundColor = .systemPink
        subView.layer.shadowOffset = CGSize(width: 40, height: 40)
        subView.layer.shadowOpacity = 1.0
        view.layer.cornerRadius = 0.5*view.bounds.size.width
        
        view.addSubview(subView)
        
        view.clipsToBounds = false
        subView.layer.masksToBounds = false
        //subView.clipsToBounds = false
        
        //view.layer.masksToBounds = false
        //subView.layer.masksToBounds = false
        //subView.clipsToBounds = false
       
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
     
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.backgroundColor = .white
        scrollView.addSubview(textView)
      
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
       
    
        
    }
    
    
}
