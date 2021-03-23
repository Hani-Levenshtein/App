//
//  BoardVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class BoardVC : UIViewController {
    
    var db: Firestore!
    var roomTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        view.backgroundColor = .gray
        self.navigationItem.title = "게시판"
        
    
    }
    
}

struct room {

    var identifier :String
    var title : String
    var numberOfPeople : Int
    var master : String
    var lastSentBy : String
    var lastSentAt : Timestamp //(date: Date())
    var lastContent : String
    var userlist : [String]
}
