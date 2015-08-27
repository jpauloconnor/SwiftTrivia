//
//  Player.swift
//  SwiftTrivia
//
//  Created by Paul O'Connor on 8/26/15.
//  Copyright (c) 2015 OCApps. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class Player: PFUser, PFSubclassing {
    @NSManaged var image  : PFFile?
    @NSManaged var music : Bool
    @NSManaged var push : Bool
    
   }

