//
//  DetailViewController.swift
//  Twitter
//
//  Created by Eileen Madrigal on 3/4/16.
//  Copyright © 2016 Eileen Madrigal. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    var tweet: Tweet!
    var retweeted = false
    var faved = false
    var favCount: Int!
    var retweetCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = 3
        profileImage.clipsToBounds = true
        
        likeButton.setImage(UIImage(named: "like"), forState: UIControlState.Normal)
        retweetButton.setImage(UIImage(named: "retweet"), forState: UIControlState.Normal)
        replyButton.setImage(UIImage(named: "reply"), forState: UIControlState.Normal)
        
        let userstring = tweet.username as? String
        nameLabel.text = tweet.name as? String
        profileImage.setImageWithURL(tweet.userpicture!)
        usernameLabel.text = "@" + userstring!
        tweetLabel.text = tweet.text as? String
        dateLabel.text = tweet.formattedDate
        retweetLabel.text = String(tweet.retweetCount)
        likesLabel.text = String(tweet.likeCount)
        
        
        profileImage.userInteractionEnabled = true
        let tapped:UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: "tappedOnImage:")
        tapped.numberOfTapsRequired = 1
        profileImage.addGestureRecognizer(tapped)
        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
                if segue.identifier == "profileSegue" {
                    let svc = segue.destinationViewController as! profileViewController;
        
                    svc.tweet = tweet
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedOnImage(sender:UITapGestureRecognizer){
        performSegueWithIdentifier("profileSegue", sender: self)
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
