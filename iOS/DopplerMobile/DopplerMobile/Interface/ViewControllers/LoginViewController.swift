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
    var loginViewModel: LoginViewModel!
    @IBOutlet fileprivate weak var txtUsername: UITextField!
    @IBOutlet fileprivate weak var txtPassword: UITextField!
    @IBOutlet fileprivate weak var btnLogin: MSButton!
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        btnLogin.command = loginViewModel.loginCommand
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    //MARK: Username Input's Actions
    @IBAction func txtUsernameEditingChanged(_ sender: UITextField)
    {
        loginViewModel.username = sender.text!
    }
    
    //MARK: Password Input's Actions
    @IBAction func txtPasswordEditingChanged(_ sender: UITextField)
    {
        loginViewModel.password = sender.text!
    }
    
    //MARK: Forgot Password Button's Actions
    @IBAction func ForgotPassword(_ sender: UIButton)
    {
        //TODO: pending implementation
        UIApplication.shared.openURL(URL(string:"https://app2.fromdoppler.com/")!)
    }
    
    //TODO: implement a generic way to navigate between view model
    func showViewModel(_ identifier: String)
    {
        performSegue(withIdentifier: identifier, sender: self)
    }
}

