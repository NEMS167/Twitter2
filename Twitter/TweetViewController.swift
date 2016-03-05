//
//  TweetViewController.swift
//  Twitter
//
//  Created by Eileen Madrigal on 2/21/16.
//  Copyright © 2016 Eileen Madrigal. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var tweets: [Tweet]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            
            self.tweets = tweets
            self.tableView.reloadData()
            
            for tweet in tweets {
                print(tweet.text)
            }
            }) { (error: NSError) -> () in
                print("error: \(error.localizedDescription)")
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets!.count
        }
        else {
            return 0
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "detailSegue" {
            let svc = segue.destinationViewController as! DetailsViewController;
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            
            let tweet = tweets![indexPath!.row]
            svc.tweet = tweet
        }
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetsCell", forIndexPath: indexPath) as! TweetsTableViewCell
        cell.tweet = tweets[indexPath.row]
        
        return cell
}
  @IBAction func onLogout(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
}