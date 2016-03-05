//
//  Tweet.swift
//  Twitter
//
//  Created by Eileen Madrigal on 2/20/16.
//  Copyright © 2016 Eileen Madrigal. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var user: User!
    var name: NSString?
    var username: NSString?
    var userpicture: NSURL?
    var text: NSString?
    var timestamp: NSString?
    var retweetCount: Int = 0
    var likeCount: Int = 0
    var createdAtString: String?
    var createdAt: NSDate?
    var formattedDate : String?
    
    init(dictionary: NSDictionary) {
        name = dictionary["user"]!["name"] as? String
        username = dictionary["user"]!["screen_name"] as? String
        let imageURLString = dictionary["user"]!["profile_image_url_https"] as? String
        if imageURLString != nil {
            userpicture = NSURL(string: imageURLString!)!
        } else {
            userpicture = NSURL(string: "http://www.instrumentationtoday.com/wp-content/themes/patus/images/no-image-half-landscape.png")
        }
        text = dictionary["text"] as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        likeCount = (dictionary["favorite_count"] as? Int) ?? 0
        
        let timestampString = dictionary["created_at"] as? String
        if timestampString != nil {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            //let timestampFormat = formatter.dateFromString(timestampString!)
            //timestamp = formatter.stringFromDate(timestampFormat!)
            createdAt = formatter.dateFromString(timestampString!)
            
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Month, .Day], fromDate: createdAt!)
            
            let month = components.month
            let day = components.day
            formattedDate = "\(month)/\(day)"
        } else {
            timestamp = "ERROR"
        }
    }
    
    class func tweetWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        
        return tweets
    }
    
}