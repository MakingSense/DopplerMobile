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
    
    @IBOutlet weak var lblErrorMessage: UILabel!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    
    //MARK: Login View's Actions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //TODO: this is AWFUL!! WE NEED TO CHANGE IT!!!
        let appDel = UIApplication.sharedApplication().delegate! as! AppDelegate
        
        // Call a method on the CustomController property of the AppDelegate
        loginViewModel = LoginViewModel(loginService: appDel.container.resolve(DMLoginServiceProtocol.self)!)
        loginViewModel.delegate = self
    }
    
    //MARK: Delegate's Actions
    
    func usernameValidationFailed()
    {
        lblUsernameLine.backgroundColor = UIColor.redColor()
        lblErrorMessage.text = "Username required"
    }
    
    func passwordValidationFailed()
    {
        lblPasswordLine.backgroundColor = UIColor.redColor()
        lblErrorMessage.text = "Password required"
    }
    
    func viewModelWillBeginLogin()
    {
        //TODO: need to show a activity
    }
    
    func viewModelDidFinishLogin()
    {
        lblErrorMessage.text = ""
        performSegueWithIdentifier("loggedInSegue", sender:self)
    }
    
    func viewModelDidFinishLoginWithError(title: String, description: String)
    {
        //TODO: maybe it could show an Alert with the Title and description
        //TODO: DM-52 service implementation fail scenarios
        btnLogin.enabled = true
        lblErrorMessage.text = description
    }
    
    //MARK: Login Button's Actions
  
    @IBAction func Login(sender: UIButton)
    {
        sender.enabled = false
        loginViewModel.username = txtUsername.text!
        loginViewModel.password = txtPassword.text!
        if loginViewModel.loginCommand.canExecute()
        {
            loginViewModel.loginCommand.execute()
        }
    }
    
    //MARK: Username Input's Actions
    
    @IBAction func txtUsernameEditingChanged(sender: UITextField)
    {
        lblUsernameLine.backgroundColor = UIColor.lightGrayColor()
        btnLogin.enabled = true
        lblErrorMessage.text = ""
    }
    
    //MARK: Password Input's Actions
    
    @IBAction func txtPasswordEditingChanged(sender: UITextField)
    {
        lblPasswordLine.backgroundColor = UIColor.lightGrayColor()
        btnLogin.enabled = true
        lblErrorMessage.text = ""
    }
    
    //MARK: Forgot Password Button's Actions
    
    @IBAction func ForgotPassword(sender: UIButton)
    {
        //TODO: pending implementation
        UIApplication.sharedApplication().openURL(NSURL(string:"https://app2.fromdoppler.com/")!)
    }
}

