//
//  NewFriendViewController.swift
//  GitHubFriends
//
//  Created by Kimberly Skipper on 12/7/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

protocol FindFriendProtocol
{
    
    func friendWasTyped(_ userName: String)
}

class NewFriendViewController: UIViewController, UITextFieldDelegate
{
    var delegate: FindFriendProtocol!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        //assigns the textFIeld delegate as self.
        textField.delegate = self
        //add text field to view
        view .addSubview(textField)
        //add search button
        view.addSubview(cancelButton)
        //add cancel button
        view.addSubview(searchButton)
        //introduces auto layout
        cancelButtonConstraints()
        searchButtonConstraints()
        view.needsUpdateConstraints()
    }
    
    func cancelButtonPressed()
    {
        self.navigationController?.popViewController(animated: true)
        //view will dismiss itself when button pressed
//        self.dismiss(animated: true, completion:
//        {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "GitHubFriendViewController")
//            self.present(vc!, animated: true, completion: nil)
//            
//        })
    }

    
    func searchButtonPressed()
    {
        self.delegate.friendWasTyped(textField.text!)
        self.navigationController?.popViewController(animated: true)

    }
//view will dismiss itself when button pressed
//        self.dismiss(animated: true, completion:
//        {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "GitHubFriendViewController")
//           self.present(vc!, animated: true, completion: nil)
//          
//      })
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        //keyboard will disappear
        textField.resignFirstResponder()
        //instead of adding a break line the text field will resign
        return false
    }
    
    //got from https://medium.com/@danstepanov/your-first-ios-app-100-programmatically-xcode-7-2-swift-2-1-3929813fa87e#.ik5x1zihu
    lazy var textField: UITextField! =
    {
        let view = UITextField()
            //set constraints to false in order to costumize
        view.translatesAutoresizingMaskIntoConstraints = false
            //customize cell
        view.borderStyle = .roundedRect
        view.textAlignment = .center
            
            return view
    }()
    
    lazy var cancelButton: UIButton! =
        {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(NewFriendViewController.cancelButtonPressed), for: .touchUpInside)
        view.setTitle("Cancel", for: .normal)
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    lazy var searchButton: UIButton! =
        {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
            view.addTarget(self, action: #selector(NewFriendViewController.searchButtonPressed), for: .touchUpInside)
        view.setTitle("Search Friend", for: .normal)
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    
    //allow your to add contraints

    override func updateViewConstraints()
    {
        textFieldConstraints()
        super.updateViewConstraints()
    }
    
    func textFieldConstraints()
    {
        //centering the text field relative to the page
        NSLayoutConstraint (item: textField, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
            .isActive = true
        
        //set the text field to be a percentage of the page
        NSLayoutConstraint (item: textField, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.8, constant: 0.0)
        .isActive = true
        
        //set the text field Y position to be 10% down from the top of the page
        NSLayoutConstraint (item: textField, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 0.1, constant: 0.0)
        .isActive = true
        
        
    }
    
    func cancelButtonConstraints()
    {
        //center button on view
        NSLayoutConstraint(item: cancelButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        .isActive = true
        
        //set width to be 30% of the page
        NSLayoutConstraint(item: cancelButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.3, constant: 0.0)
        .isActive = true
        
        //set Y postion relative to the bottom of the page 
        NSLayoutConstraint(item: cancelButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 0.9, constant: 0.0)
        .isActive = true
    }
    
    func searchButtonConstraints()
    {
        //center button on view
        NSLayoutConstraint(item: searchButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        .isActive = true
        //set width to 30%
        NSLayoutConstraint(item: searchButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.3, constant: 0.0)
        .isActive = true
        //Y postions to the top of the page ( i would like to figure out how to relate it to the textfield.)
        NSLayoutConstraint(item: searchButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        .isActive = true
    }
    
} //end class
