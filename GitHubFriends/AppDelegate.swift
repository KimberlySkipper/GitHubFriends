//
//  AppDelegate.swift
//  GitHubFriends
//
//  Created by Kimberly Skipper on 12/7/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?

    //either is did finish lauching: true, or it didn't: false
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        //create a window object. instanciate/initialize a new window object. make the window the same size as the screen.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //now create a new GitHubFriend View Controller object.  this constant only exsists in this function(method)
        let friendListVC = GitHubFriendTableViewController()
        
        //create newFriend VC.
        //********let newFriendVC = NewFriendViewController()
        //embbed in navigation bar. the root view controller is the GitHubFriend view controller for the UINavigationCOntroller
        let navController = UINavigationController(rootViewController: friendListVC)
        //added NewFriendViewController
       // *****navController.viewControllers.append(newFriendVC)
        
        
        
        // making the navigation controller the initial view.
        window?.rootViewController = navController
        //call a funtion on the window where you make "key window" and make it visible. necessary even though we only have one window.
        window?.makeKeyAndVisible()
        
        return true
        
    }

    func applicationWillResignActive(_ application: UIApplication)
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

