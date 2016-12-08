//
//  GitHubAPIController.swift
//  GitHubFriends
//
//  Created by Kimberly Skipper on 12/7/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

class GitHubAPIController
{
    //initializing the class GitHUbAPIController
    init()
    {
    
    }
    //creating a method to search git hub. friend name is the argument passed in of type string.
    func searchGitHubFor(_ friendName: String)
    {
        //escaping means that you are replacing the charaters that are present with special charatcters, such as the spaces for percent signs. this is given "CharacterSet.aplphanumerics" whis is all letters Aa-Zz and numbers 0-9
        if let escapedFriendName = friendName.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)
        {
            //search GitHub API
            let urlPath = "https://api.github.com/users/\(escapedFriendName)"
            //URL object initalized with string.  (convert the string to a URL)
            let url = URL(string: urlPath)!
            //url session is a object that manages the network calls that you make in the app session.
            // URLSession iOS built for us
            let session = URLSession.shared
            //completeion handler is a CLOSURE(aynonumus method) method without a name. it is being defiened and called right here.
            //a task has to be related to a session.  this has two arguments with and completion handler. "with": url! is which server are we talking too.
            let task = session.dataTask(with: url, completionHandler: {data, response, error -> Void in
                //for debugging purposes
                print("Task completed")
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                
                else if let dictionary = self.parseJSON(data!)
                {
                    
                }
                
            })
            task.resume()

        }
    }
    // write a method to parse JSON file
    func parseJSON(_ data: Data) -> [String: Any]?
    {
        //will add more just returning nil for no
        return nil
    }

}
