//
//  reportVC.swift
//  haniProject
//
//  Created by Hani on 2021/05/12.
//

import UIKit

class reportVC: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(cancelFeedButtonTapped))
        
        
    }
    
    @objc private func cancelFeedButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
