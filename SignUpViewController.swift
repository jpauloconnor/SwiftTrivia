//
//  SignUpViewController.swift
//  SwiftTrivia
//
//  Created by Paul O'Connor on 8/26/15.
//  Copyright (c) 2015 OCApps. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import ParseFacebookUtils

class SignUpViewController: NSObject, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate  {
    var window: UIWindow!
    
    init (window: UIWindow) {
        super.init()
        self.window = window
        if Player.currentUser() != nil {
            showStoryboard()
            println("It Works")
        } else {
            showLogin()
        }
    }
    
    func showStoryboard() {
        var storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var start = storyBoard.instantiateInitialViewController() as!UITabBarController
        window?.rootViewController = start
        window?.makeKeyAndVisible()
        
    }
    
    func showLogin() {
        let loginViewController = PFLogInViewController ()
        loginViewController.delegate = self
        loginViewController.facebookPermissions = ["user_about_me"]
        
        
        // Fields to display on login page
        loginViewController.fields =  PFLogInFields.UsernameAndPassword | PFLogInFields.SignUpButton | PFLogInFields.LogInButton | PFLogInFields.PasswordForgotten | PFLogInFields.Facebook | PFLogInFields.Twitter
        
        // Logo file for login page
        var logoImage = UIImageView()
        logoImage.image = UIImage(named: "myImage")
        logoImage.contentMode = UIViewContentMode.ScaleAspectFit
        loginViewController.logInView?.logo = logoImage
        
        
        //Create a SignUpViewController
        let signUpViewController = PFSignUpViewController ()
        signUpViewController.delegate = self
        loginViewController.signUpController = signUpViewController
        loginViewController.signUpController!.delegate = self
        
        signUpViewController.fields = PFSignUpFields.UsernameAndPassword | PFSignUpFields.SignUpButton | PFSignUpFields.DismissButton
        
        var signUpLogo = UIImageView()
        signUpLogo.image = UIImage(named: "myImage")
        signUpLogo.contentMode = UIViewContentMode.ScaleAspectFit
        signUpViewController.signUpView?.logo = signUpLogo
        
        window.rootViewController = loginViewController
        window.makeKeyAndVisible()
    }
    
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        println("This didn't work.")
        
        
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        println("Cancelled signup")
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        let player = user as! Player
        player.saveInBackground()
        
        let installation = PFInstallation.currentInstallation()
        installation["user"] = player
        installation.saveInBackgroundWithBlock(nil)
        
        showStoryboard()
    }
    
    func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController) {
        println("Cancelled login")
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        println("Login busted.")
        let message: String
        if let errorCode = error?.code{
            switch errorCode {
            case 101:
                message = "Invalid Username or Password"
            default:
                message = "There was an error attempting to log you in."
            }
        }else {
            message = "There was an error attempting to log you in."
        }
        let alert = UIAlertController(title: "Login Error", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Return to Login", style: UIAlertActionStyle.Default, handler: nil))
        
        logInController.presentViewController(alert, animated: true, completion: nil)
        
    }
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        let player = user as! Player
        player.saveInBackgroundWithBlock(nil)
        
        // Add user to installation
        let installation = PFInstallation.currentInstallation()
        installation["user"] = player
        installation.saveInBackgroundWithBlock(nil)
        
        showStoryboard()
    }
    
}
