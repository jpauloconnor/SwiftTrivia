//
//  Player.swift
//  SwiftTrivia
//
//  Created by Paul O'Connor on 8/27/15.
//  Copyright (c) 2015 OCApps. All rights reserved.
//

import UIKit
import Parse

class Player: PFUser, PFSubclassing {
    @NSManaged var name : String?
}
