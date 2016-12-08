//
//  Friend.swift
//  GitHubFriends
//
//  Created by Kimberly Skipper on 12/7/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

struct Friend
{
    let name: String
    let company: String
    let avatar: String

    init(name: String, company: String, avatar: String)
    {
        self.name = name
        self.company = company
        self.avatar = avatar
    }
}
