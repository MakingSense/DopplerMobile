//
//  LoginViewController.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 2/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, NavigationDelegate
{
    //MARK: Properties
    private var loginViewModel: LoginViewModel!
    @IBOutlet private weak var txtUsername: UITextField!
    @IBOutlet private weak var txtPassword: UITextField!
    @IBOutlet private weak var lblUsernameLine: UILabel!
    @IBOutlet private weak var lblPasswordLine: UILabel!
    @IBOutlet private weak var lblErrorMessage: UILabel!
    @IBOutlet private weak var btnLogin: MSButton!
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loginViewModel = LoginViewModel(loginService: LoginService(), nagivationDelegate: self)
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
    
    //TODO: implement a generic way to navigate between view model
    func showViewModel(identifier: SegueIdentifier)
    {
        performSegueWithIdentifier(identifier.rawValue, sender: self)
    }
}

