//
//  ViewController.swift
//  Twitter
//
//  Created by Eileen Madrigal on 2/14/16.
//  Copyright © 2016 Eileen Madrigal. All rights reserved.
//


import UIKit
import AFNetworking
import BDBOAuth1Manager

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Actions
    @IBAction func onLogin(sender: AnyObject) {
        
        let client = TwitterClient.sharedInstance
        
        client.login({ () -> () in
            print("I've logged in")
            }) { (error: NSError) -> () in
                print("Error:\(error.localizedDescription)")
        }
    
}
                 