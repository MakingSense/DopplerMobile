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
    fileprivate var loginViewModel: LoginViewModel!
    @IBOutlet fileprivate weak var txtUsername: UITextField!
    @IBOutlet fileprivate weak var txtPassword: UITextField!
    @IBOutlet fileprivate weak var lblUsernameLine: UILabel!
    @IBOutlet fileprivate weak var lblPasswordLine: UILabel!
    @IBOutlet fileprivate weak var lblErrorMessage: UILabel!
    @IBOutlet fileprivate weak var btnLogin: MSButton!
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loginViewModel = LoginViewModel(loginService: LoginService(), nagivationDelegate: self)
        btnLogin.command = loginViewModel.loginCommand
    }
    
    //MARK: Username Input's Actions
    @IBAction func txtUsernameEditingChanged(_ sender: UITextField)
    {
        loginViewModel.username = sender.text!
        lblUsernameLine.backgroundColor = UIColor.lightGray
        lblErrorMessage.text = ""
    }
    
    //MARK: Password Input's Actions
    @IBAction func txtPasswordEditingChanged(_ sender: UITextField)
    {
        loginViewModel.password = sender.text!
        lblPasswordLine.backgroundColor = UIColor.lightGray
        lblErrorMessage.text = ""
    }
    
    //MARK: Forgot Password Button's Actions
    @IBAction func ForgotPassword(_ sender: UIButton)
    {
        //TODO: pending implementation
        UIApplication.shared.openURL(URL(string:"https://app2.fromdoppler.com/")!)
    }
    
    //TODO: implement a generic way to navigate between view model
    func showViewModel(_ identifier: SegueIdentifier)
    {
        performSegue(withIdentifier: identifier.rawValue, sender: self)
    }
}

