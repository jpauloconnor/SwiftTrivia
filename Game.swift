//
//  Game.swift
//  SwiftTrivia
//
//  Created by Paul O'Connor on 8/26/15.
//  Copyright (c) 2015 OCApps. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class Game: PFObject, PFSubclassing {
    class func parseClassName() -> String {
        return "Game"
    }
    @NSManaged var rating : String
    @NSManaged var score : Int
    @NSManaged var user : PFUser
    @NSManaged var date : NSDate
}

