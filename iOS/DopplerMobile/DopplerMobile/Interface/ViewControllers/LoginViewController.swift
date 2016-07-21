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
    
    private var loginViewModel: LoginViewModel!
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblUsernameLine: UILabel!
    
    @IBOutlet weak var lblPasswordLine: UILabel!
    
    @IBOutlet weak var lblErrorMessage: UILabel!
    
    @IBOutlet weak var btnLogin: MSButton!
    
    //MARK: Login View's Actions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loginViewModel = LoginViewModel(loginDelegate: self)
        btnLogin.command = loginViewModel.loginCommand
    }
    
    //MARK: Username Input's Actions
    
    @IBAction func txtUsernameEditingChanged(sender: UITextField)
    {
        loginViewModel.username = sender.text!
        lblUsernameLine.backgroundColor = UIColor.lightGrayColor()
        lblErrorMessage.text = ""
    }
    
    //MARK: Password Input's Actions
    
    @IBAction func txtPasswordEditingChanged(sender: UITextField)
    {
        loginViewModel.password = sender.text!
        lblPasswordLine.backgroundColor = UIColor.lightGrayColor()
        lblErrorMessage.text = ""
    }
    
    //MARK: Forgot Password Button's Actions
    
    @IBAction func ForgotPassword(sender: UIButton)
    {
        //TODO: pending implementation
        UIApplication.sharedApplication().openURL(NSURL(string:"https://app2.fromdoppler.com/")!)
    }
}

