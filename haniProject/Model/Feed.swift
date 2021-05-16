//
//  Feed.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import Foundation

struct Feed {
    var identifier: String
        
    var title: String
    var content: String
    
    var uploadAt: Date
    var uploadBy: String
   
    var photo: [String]
    var hashtag: [String]
    
    var commentsCount: Int
    var likesCount: Int
    var viewsCount: Int
    
    init(
        identifier: String,
        
        title: String,
        content: String,
        
        uploadAt: Date,
        uploadBy: String,
   
        photo: [String],
        hashtag: [String],
        
        commentsCount: Int,
        likesCount: Int,
        viewsCount: Int
        ){
        
        self.identifier = identifier
        
        self.title = title
        self.content = content
        
        self.uploadAt = uploadAt
        self.uploadBy = uploadBy
        
        self.commentsCount = 0
        self.likesCount = 0
        self.viewsCount = 0
        
        self.photo = photo
        self.hashtag = hashtag
        
    }
}
