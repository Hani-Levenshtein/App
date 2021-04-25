//
//  ChatVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ChatAndAlarmVC : UIViewController{
  
    var db: Firestore!
    var auth = FirebaseAuth.Auth.auth()
    
    var rooms: [Room] = []
    var roomCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.topItem?.title = "게시판"
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.black
        
        self.roomCollectionView?.delegate = self
        self.roomCollectionView?.dataSource = self
        roomCollectionView?.register(RoomCell.self, forCellWithReuseIdentifier: "RoomCell")
        
      
        db = Firestore.firestore()
        
        /*
        let createRoomButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [createRoomButton]
        
        db.collection("users").whereField("identifier",arrayContains: Auth.auth().currentUser?.uid ?? "").addSnapshotListener{ [self](querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {return}
            
            self.rooms = documents.map { querySnapshot -> Room in
                
                let room = querySnapshot.data()
                let title = room["title"] as? String ?? ""
                let peopleCount = room["peopleCount"] as? Int ?? 0
                let lastSentAt = room["lastSentAt"] as? Timestamp
                let lastContent = room["lastContent"] as? String ?? ""
 
                return Room(title: title, img: img, roomID: roomID)
            }
            self.roomCollectionView?.reloadData()
        }
        */
    }

    @objc func addTapped(){
        
    }
}

extension ChatAndAlarmVC {
    func setView() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "채팅"
    }
    
    func setAutoLayout() {
            
    }
    
}




extension ChatAndAlarmVC: UICollectionViewDelegate,UICollectionViewDataSource {
    //Compulsory: numberOfItemsInSection, cellForItemAt
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rooms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let roomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoomCell", for: indexPath)
                as? RoomCell else {return UICollectionViewCell()}
        
        roomCell.configure()
        
        
        return roomCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("collectioview tappeed")
    }
}
