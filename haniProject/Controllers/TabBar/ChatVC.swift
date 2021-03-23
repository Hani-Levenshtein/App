//
//  ChatVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ChatVC : UIViewController{
    
    var db: Firestore!
    var auth = FirebaseAuth.Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        db = Firestore.firestore()
        
        
        
        self.title = "채팅"
        view.backgroundColor = .orange
    }
    
}
