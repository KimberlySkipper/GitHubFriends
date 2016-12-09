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

    //calling func directly on structure. producing friend arrays from a dictionary.
    static func createFriendFromJSONDictionary(_ aDictionaryMadeFromJSON: [String: Any]) -> Friend?
    {
        var friend: Friend?
        if aDictionaryMadeFromJSON.count > 0
        {
//            for anEntry in aDictionaryMadeFromJSON
//            {
                //look at each result in the results array and make sure it is a dictionary
                
                //looking for a "key" called collection name and cast it as a string
                //(dictionary != nil)
                
//                if let subDictinoary = anEntry as? [String: Any]
//                {
                    let aName = aDictionaryMadeFromJSON["name"] as? String
                    let aCompany = aDictionaryMadeFromJSON["company"] as? String
                    let avatar_url = aDictionaryMadeFromJSON["avatar_url"] as? String ?? ""
                    friend = Friend(name: aName!, company: aCompany!, avatar_url: avatar_url)
                    //friend.append(aFriend)
        
//                }
                
                

//              }
        }
        return friend
        
    }
}



