//
//  WelcomeViewController.swift
//  SwiftTrivia
//
//  Created by Paul O'Connor on 8/27/15.
//  Copyright (c) 2015 OCApps. All rights reserved.
//


import UIKit
import Parse

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        textView.flashScrollIndicators()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logout(sender: UIButton) {
        PFUser.logOut()
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        appDelegate?.loginCheck()
    }
}
