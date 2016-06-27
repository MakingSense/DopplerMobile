//
//  LoginViewController.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 2/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewModelDelegate
{
    //MARK: Properties
    
    private var loginViewModel: LoginViewModel!

    @IBOutlet weak var txtUsername: UITextField!

    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblUsernameLine: UILabel!
    
    @IBOutlet weak var lblPasswordLine: UILabel!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    
    //MARK: Login View's Actions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loginViewModel = LoginViewModel(loginService: LoginService())
        loginViewModel.delegate = self
    }
    
    //MARK: Delegate's Actions
    
    func usernameValidationFailed()
    {
        lblUsernameLine.backgroundColor = UIColor.redColor()
    }
    
    func passwordValidationFailed()
    {
        lblPasswordLine.backgroundColor = UIColor.redColor()
    }
    
    func loginSucceded()
    {
        //TODO: DM-55 show welcome view
        btnLogin.backgroundColor = UIColor.greenColor()
    }
    
    func loginFailed() {
        //TODO: DM-52 service implementation fail scenarios
        btnLogin.backgroundColor = UIColor.redColor()
    }
    
    //MARK: Login Button's Actions
  
    @IBAction func Login(sender: UIButton)
    {
        sender.enabled = false
        loginViewModel.username = txtUsername.text!
        loginViewModel.password = txtPassword.text!
        if loginViewModel.validateInput()
        {
            loginViewModel.login()
        }
    }
    
    //MARK: Username Input's Actions
    
    @IBAction func txtUsernameEditingChanged(sender: UITextField)
    {
        lblUsernameLine.backgroundColor = UIColor.lightGrayColor()
        btnLogin.enabled = true
    }
    
    //MARK: Password Input's Actions
    
    @IBAction func txtPasswordEditingChanged(sender: UITextField)
    {
        lblPasswordLine.backgroundColor = UIColor.lightGrayColor()
        btnLogin.enabled = true
    }
    
    //MARK: Forgot Password Button's Actions
    
    @IBAction func ForgotPassword(sender: UIButton)
    {
        //TODO: pending implementation
        UIApplication.sharedApplication().openURL(NSURL(string:"https://app2.fromdoppler.com/")!)
    }
}

