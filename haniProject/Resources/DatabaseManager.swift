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

    static func deleteFeed(_ feed: Feed){
        let db = Firestore.firestore()
        db.collection("feeds").document(feed.identifier).delete()
    }

    static func addRoom(_ feed: Feed) -> String {
        let db = Firestore.firestore()
        let roomRef: String = db.collection("rooms").document().documentID
        
        db.collection("rooms").document(roomRef).updateData(["userList": FieldValue.arrayUnion([Auth.auth().currentUser!.uid, feed.uploadBy])]){ err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }

        db.collection("users").document(Auth.auth().currentUser!.uid).updateData(["roomList": FieldValue.arrayUnion([roomRef])]){ err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        
        db.collection("users").document(feed.uploadBy).updateData(["roomList": FieldValue.arrayUnion([roomRef])]){ err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        return roomRef
    }
}
