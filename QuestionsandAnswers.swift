//
//  QuestionsandAnswers.swift
//  SwiftTrivia
//
//  Created by Paul O'Connor on 8/26/15.
//  Copyright (c) 2015 OCApps. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class QuestionsandAnswers: PFObject, PFSubclassing {
    
    class func parseClassName() -> String {
        return "QuestionsandAnswers"
    }
    
    @NSManaged var Answers : [String]
    @NSManaged var Question : String
    @NSManaged var Answer : Int
    
}

