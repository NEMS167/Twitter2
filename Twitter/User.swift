//
//  User.swift
//  Twitter
//
//  Created by Eileen Madrigal on 2/20/16.
//  Copyright © 2016 Eileen Madrigal. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: NSString?
    var screenname: NSString?
    var profileUrl: NSURL?
    var tagline: NSString?
    
    init(dictionary: NSDictionary){
       
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
       tagline = dictionary["description"] as? String
       let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString{
            profileUrl = NSURL(string: profileUrlString)
            
        }
       
        
    }


}
