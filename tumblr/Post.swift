//
//  Post.swift
//  tumblr
//
//  Created by Phillip Pang on 10/12/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import Foundation

public class Post{
    
    var blog_name: String
    var id: Int
    var type: String
    var date: Date
    var summary: String
    var caption: String
    var imagePath: URL?
    
    
    
    init(name: String, id: Int, type: String, date: Date, summary: String, caption: String, imagePath: URL? ){
        
        self.blog_name = name
        self.id = id
        self.type = type
        self.date = date
        self.summary = summary
        self.caption = caption
        
    }
    
}
