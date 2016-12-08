//
//  GitHubFriendTableViewController.swift
//  GitHubFriends
//
//  Created by Kimberly Skipper on 12/7/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class GitHubFriendTableViewController: UITableViewController, GitHubAPIControllerProtocol
{
    // this property will persist throughout the entire class.
    //!(optional) it can be nil or it can have a value. currently it is nil a reference that points to nothing
    //name: type
    var api: GitHubAPIController!
    //var gitHubUser = [friend]()

    override func viewDidLoad()
    {
        //runs automatically after the app is launched. Happens in seconds
        super.viewDidLoad()
        title = "Friend List"
        //initalize the GitHUbAPI controller.(make new GHapiController object and store it in the api property.)
        api = GitHubAPIController(delegate: self)
        api.searchGitHubFor("jskipgit")
        

        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    //send the results back using this Protocol
    func didReceiveAPIResults (_ results:[Any])
    {
        //let queue = DispatchQueue.main
        //queue.async
        
         print("WINNER WINNER CHICKEN DINNER")
        
    }
    

    

}
