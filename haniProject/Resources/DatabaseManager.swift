//
//  ReadAndWirte.swift
//  haniProject
//
//  Created by Hani on 2021/04/14.
//

import Foundation
import Firebase

class DatabaseManager {
    
    
    
    static func addFeed(feed: Feed) {
        let db = Firestore.firestore()
        db.collection("feeds").document(feed.identifier).setData([
                                            "identifier": feed.identifier,
                                            
                                            "title": feed.title,
                                            "content": feed.content,
                                            
                                            "uploadAt": feed.uploadAt,
                                            "uploadBy": feed.uploadBy,
                                       
                                            "photo": feed.photo,
                                            "hashtag": feed.hashtag,
                                     
                                            "commentsCount": feed.commentsCount,
                                            "likesCount": feed.likesCount,
                                            "viewsCount": feed.viewsCount
                                            ])
         
    }
    func createRoom(){
        /*
        db.collection("users").document(Auth.auth().currentUser!.uid).updateData([
                                                                                    "roomList": FieldValue.arrayUnion([ref?.documentID])])
         */
    }
}
