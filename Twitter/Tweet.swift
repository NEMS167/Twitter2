//
//  Tweet.swift
//  Twitter
//
//  Created by Eileen Madrigal on 2/20/16.
//  Copyright © 2016 Eileen Madrigal. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    
    init(dictionary: NSDictionary){
        text = dictionary["text"] as? String
        retweetCount = (dictionary["retweet_count"] as! Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0

        let timestampString = dictionary["created"] as? String
        
        if let timestampString = timestampString{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        timestamp = formatter.dateFromString(timestampString)
        
        }
        
    }
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
    }
    

}
