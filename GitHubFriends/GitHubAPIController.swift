//
//  GitHubAPIController.swift
//  GitHubFriends
//
//  Created by Kimberly Skipper on 12/7/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
//Declare Delegate
protocol GitHubAPIControllerProtocol
{
    //declare function.  don need to say what it does
    func didReceiveAPIResults(_ dictionary: [String: Any])
}

class GitHubAPIController
{
    //property named delegate that stores gitHubAPIControllerProtocol
    var delegate: GitHubAPIControllerProtocol
    //initializing the class GitHubAPIController.  it is to create new objects of this type GHAPICProtocl
    //argument called delegate that passes in GitHubAPIContollerProtocol
    init(delegate: GitHubAPIControllerProtocol)
    {
        //take the delegate argument and set it equal to the property called delegate.  since they have the same name use self.delegate for the property
        self.delegate = delegate
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
                //if I dont get an error then I want to parse the data and return it to TVC
                else if let dictionary = self.parseJSON(data!)//data is the type i want to parse?
                {
//                    if let name = dictionary["name"] as? [Any]
//                    {
                    //the I want to share the data with the TVC?
                    self.delegate.didReceiveAPIResults(dictionary)
//                    }
                }
                
            })
            task.resume()

        }
    }
    // write a method to parse JSON file.  GitHub returns a Dictionary
    func parseJSON(_ FriendInfo: Data) -> [String: Any]?
    {
        do
        {
            let json = try JSONSerialization.jsonObject(with: FriendInfo, options: [])
            if let dictionary = json as? [String: Any]//is a key word for wild card.
            {
                return dictionary
            }
            else
            {
                return nil
            }
            
        }
        // if parsing json fails then goes to catch block
        catch let error as NSError
        {
            //print error and return nil
            print(error)
            return nil
        }
    }

}














