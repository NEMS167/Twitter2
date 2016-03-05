//
//  TweetsTableViewCell.swift
//  Twitter
//
//  Created by Eileen Madrigal on 2/21/16.
//  Copyright © 2016 Eileen Madrigal. All rights reserved.
//

import UIKit

class TweetsTableViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var retweetImage: UIImageView!
    @IBOutlet weak var replyImage: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            let userstring = tweet.username as? String
            nameLabel.text = tweet.name as? String
            profileImage.setImageWithURL(tweet.userpicture!)
            usernameLabel.text = "@" + userstring!
            timeLabel.text = tweet.formattedDate 
            tweetLabel.text = tweet.text as? String
            likeImage.image = UIImage(named: "like")
            retweetImage.image = UIImage(named: "retweet")
            replyImage.image = UIImage(named: "reply")
            retweetLabel.text = String(tweet.retweetCount)
            likeLabel.text = String(tweet.likeCount)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //tweetLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = 3
        profileImage.clipsToBounds = true
      
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
