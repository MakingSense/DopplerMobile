//
//  LoginViewController.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 2/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    //MARK: Properties
    var loginViewModel: LoginViewModel!

    @IBOutlet weak var txtUsername: UITextField!

    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loginViewModel = LoginViewModel()
    }
    
    //MARK: Login Button's Actions
  
    @IBAction func Login(sender: UIButton)
    {
        loginViewModel.login(txtUsername.text!, password: txtPassword.text!)
    }
    
    
    //MARK: Forgot Password Button's Actions
    
    @IBAction func ForgotPassword(sender: UIButton)
    {
        //TODO: pending implementation
        UIApplication.sharedApplication().openURL(NSURL(string:"https://app2.fromdoppler.com/")!)
    }
}

