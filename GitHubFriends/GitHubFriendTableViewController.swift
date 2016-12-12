//
//  GitHubFriendTableViewController.swift
//  GitHubFriends
//
//  Created by Kimberly Skipper on 12/7/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class GitHubFriendTableViewController: UITableViewController, GitHubAPIControllerProtocol, FindFriendProtocol
{
    // this property will persist throughout the entire class.
    //!(optional) it can be nil or it can have a value. currently it is nil a reference that points to nothing
    var api: GitHubAPIController!
    var arrayOfFriends = [Friend]()

    override func viewDidLoad()
    {
        //runs automatically after the app is launched. Happens in seconds
        super.viewDidLoad()
        title = "Friend List"
        //add search to navigation bar in TVC
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(goToSearchPage)), animated: true)
        //initalize the GitHUbAPI controller.(make new GHapiController object and store it in the api property.)
        api = GitHubAPIController(delegate: self)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")
    }
    
    
    @IBAction func goToSearchPage (_ sender: UIBarButtonItem)
    {
        let newFriendVC = NewFriendViewController()
        //I am your dlegate i speak for the trees.
        newFriendVC.delegate = self
        //set the navigation controller to push the NewFriendVC to the front when search ICon is selected.
        self.navigationController?.pushViewController(newFriendVC, animated: true)
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayOfFriends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        let aFriend = arrayOfFriends[indexPath.row]
        cell.textLabel?.text = aFriend.name

        return cell
    }
    
    
    //send the results back using this protocol method
    func didReceiveAPIResults (_ dictionary:[String: Any])
    {
        let queue = DispatchQueue.main
        queue.async
        {
            //information from Friends Model class
            if let madeAFriend = Friend.createFriendFromJSONDictionary(dictionary)
            {
                self.arrayOfFriends.append(madeAFriend)
                self.tableView.reloadData()
            }
        }
    }
    
    
    func friendWasTyped(_ userName: String)
    {
        // moved this from viewDidLoad to complete func 
        api.searchGitHubFor(userName)
    }

}// end class

