//
//  ForgotPasswordViewController.swift
//  DopplerMobile
//
//  Created by Admin on 30/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import Bond
import IHKeyboardAvoiding
import KRProgressHUD

class ForgotPasswordViewController: UIViewController, NavigationDelegate {
    
    // MARK: Constants
    private let keyboardAvoidingPadding = 10.0
    
    // MARK: UI Properties
    @IBOutlet weak var txtUsername: DMTextField!
    @IBOutlet weak var btnRequest: UIButton!
    
    // MARK: Other properties
    var viewModel: ForgotPasswordViewModel!
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        // txtUsername bindings
        viewModel.username
            .bidirectionalBind(to: txtUsername.reactive.text)
            .dispose(in: reactive.bag)
        
        // btnLogin bindings
        btnRequest.reactive.tap
            .observe { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.viewModel.forgotPassword()
            }.dispose(in: reactive.bag)
        
        viewModel.requestCanExecute.bind(to: btnRequest.reactive.isEnabled)
        
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
