//
//  LoginViewController.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 2/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import Bond
import IHKeyboardAvoiding
import SwiftVideoBackground
import KRProgressHUD

class LoginViewController: UIViewController, NavigationDelegate {
    
    // MARK: Constants
    private let keyboardAvoidingPadding = 10.0
    
    // MARK: UI Properties
    @IBOutlet weak var vwVideoBackground: BackgroundVideo!
    @IBOutlet weak var vwOverlayView: UIView!
    @IBOutlet weak var vwTextfieldsContainer: UIView!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!

    // MARK: Other properties
    var viewModel: LoginViewModel!

    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    private func setupUI() {
        // Keyboard avoiding
        KeyboardAvoiding.setAvoidingView(vwOverlayView, withTriggerView: vwTextfieldsContainer)
        KeyboardAvoiding.paddingForCurrentAvoidingView = CGFloat(keyboardAvoidingPadding)
        
        // Video background
        vwVideoBackground.createBackgroundVideo(name: "LoginBackground", type: "mp4", alpha: 0.1)
    }
    
    private func bindViewModel() {
        // txtUsername bindings
        viewModel.username
            .bidirectionalBind(to: txtUsername.reactive.text)
            .dispose(in: reactive.bag)
        
        // txtPassword bindings
        viewModel.password
            .bidirectionalBind(to: txtPassword.reactive.text)
            .dispose(in: reactive.bag)
        
        // btnLogin bindings
        btnLogin.reactive.tap
            .observe { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.viewModel.login()
            }.dispose(in: reactive.bag)
        
        viewModel.loginCanExecute.bind(to: btnLogin.reactive.isEnabled)
        
        // btnForgotPassword bindings
        btnForgotPassword.reactive.tap
            .observe { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.viewModel.forgotPassword()
            }.dispose(in: reactive.bag)
        
        // KRProgressHUD bindings
        viewModel.isBusy
            .observeNext { isBusy in
                if isBusy {
                    KRProgressHUD.show()
                } else {
                    KRProgressHUD.dismiss()
                }
            }.dispose(in: reactive.bag)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //TODO: implement a generic way to navigate between view model
    func showViewModel(_ identifier: String) {
        performSegue(withIdentifier: identifier, sender: self)
    }
}

