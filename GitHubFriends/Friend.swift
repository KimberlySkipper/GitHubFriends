//
//  Friend.swift
//  GitHubFriends
//
//  Created by Kimberly Skipper on 12/7/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

//can use struct because the data that we are going to model is read only.  can not be edited.
struct Friend
{
    let name: String
    let company: String
    let avatar: String
    
    //how a friend object is created
    init(name: String, company: String, avatar_url: String)
    {
        self.name = name
        self.company = company
        self.avatar = avatar_url
        
    }

    //calling func directly on structure. producing a friend object from a dictionary.
    static func createFriendFromJSONDictionary(_ aDictionaryMadeFromJSON: [String: Any]) -> Friend?
    {
        var friend: Friend?
        if aDictionaryMadeFromJSON.count > 0
        {
            //set name to accept empty string as a value otherwise the app will crash of given a name that is not valid.  "??"" is Default Value"
            let aName = aDictionaryMadeFromJSON["name"] as? String ?? ""
            let aCompany = aDictionaryMadeFromJSON["company"] as? String ?? ""
            let avatar_url = aDictionaryMadeFromJSON["avatar_url"] as? String ?? ""
            friend = Friend(name: aName, company: aCompany, avatar_url: avatar_url)
        
        }
        return friend
        
    }
}



