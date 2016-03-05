//
//  profileViewController.swift
//  Twitter
//
//  Created by Eileen Madrigal on 3/4/16.
//  Copyright © 2016 Eileen Madrigal. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
   
    var tweet: Tweet!
    var retweeted = false
    var faved = false
    var favCount: Int!
    var retweetCount: Int!
    var replyusername: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = 3
        profileImage.clipsToBounds = true
        
        
        let userstring = tweet.username as? String
        nameLabel.text = tweet.name as? String
        profileImage.setImageWithURL(tweet.userpicture!)
        usernameLabel.text = "@" + userstring!
        //followingLabel.text = String(tweet.user!.following!)
       // followersLabel.text = String(tweet.user!.followers!)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
