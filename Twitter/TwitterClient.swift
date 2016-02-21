//
//  TwitterClient.swift
//  Twitter
//
//  Created by Eileen Madrigal on 2/14/16.
//  Copyright © 2016 Eileen Madrigal. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "InpXRJDJefFwigmVF6aSyF4WS"
let twitterConsumerSecret = "U3diXlkY9ry7GNpzXyV0mXB6lNoPCadq0dNR0krNA5WLU7chsM"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    static let sharedInstance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
    
    var loginSuccess : (() -> ())?
    var loginFailure : ((NSError) -> ())?
    
    
    func login(success: () -> (), failure: (NSError) -> ()){
        loginSuccess = success
        loginFailure = failure
        let client = TwitterClient.sharedInstance
        
        client.deauthorize()
        client.fetchRequestTokenWithPath("oauth/request_token" , method: "GET", callbackURL: NSURL(string: "twitterdemo://oauth"), scope: nil,
            success: {(requestToken: BDBOAuth1Credential!) -> Void in
                print("Got the request token")
                let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
                
                UIApplication.sharedApplication().openURL(url!)
            })
            {(error: NSError!) -> Void in
                print("error:\(error.localizedDescription)")
                self.loginFailure?(error)
        }
        
    }
    func currentAccount(){
        GET("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: {(task: NSURLSessionDataTask, response: AnyObject?)-> Void in
            print("account:\(response)")
            let user = response as! NSDictionary
            // print("name:\(user["name"])")
            
            //let user = User(dictionary: userDictionary)
            
            },failure: {(task: NSURLSessionDataTask?,error: NSError)-> Void in
        })
        
    }
    func handleOpenUrl(url: NSURL){
       let requestToken = BDBOAuth1Credential(queryString: url.query)
        fetchAccessTokenWithPath("oath/access_token", method: "POST" , requestToken: requestToken, success: {(accessToken: BDBOAuth1Credential!)-> Void in
            
            self.loginSuccess?()
            print("I got the access token!")
            
    
            }) {(error: NSError!) -> Void in
                print("error:\(error.localizedDescription)")
                self.loginFailure?(error)
        }
        
    }
    
    func homeTimeline(success: ([Tweet]) -> (), failure: (NSError) -> ()){
        GET("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: {(task: NSURLSessionDataTask, response: AnyObject?)-> Void in
            
            let dictionaries = response as! [NSDictionary]
            let tweets = Tweet.tweetsWithArray(dictionaries)
            
            success(tweets)
            },failure: {(task: NSURLSessionDataTask?, error: NSError) -> Void in
                failure(error)
                
        })
        }
    
}





