//
//  ApplicationAssembly.swift
//  DopplerMobile
//
//  Created by Marcelo Vazquez on 9/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Typhoon

///Summary:
///   App's composition root
public class ApplicationAssembly : TyphoonAssembly
{
    public dynamic func appDelegate() -> Any { return DI.lazySingleton(AppDelegate.self) }
    public dynamic func navigationDelegate() -> Any { return DI.lazySingleton(NavigationHandler.self, selector: #selector(NavigationHandler.init(appDelegate:)), initParameters: [self.appDelegate()])}

    // MARK: Services
    
    public dynamic func authenticationService() -> Any { return DI.lazySingleton(AuthenticationService.self) }
    
    // MARK: ViewModels
    
    public dynamic func loginViewModel() -> Any { return DI.lazySingleton(LoginViewModel.self, selector: #selector(LoginViewModel.init(authenticationService:navigationDelegate:)), initParameters: [self.authenticationService(), self.navigationDelegate()])}
    
    public dynamic func forgotPasswordViewModel() -> Any { return DI.lazySingleton(ForgotPasswordViewModel.self, selector: #selector(ForgotPasswordViewModel.init(authenticationService:navigationDelegate:)), initParameters: [self.authenticationService(), self.navigationDelegate()])}
    
    public dynamic func accountViewModel() -> Any { return DI.lazySingleton(AccountViewModel.self, selector: #selector(AccountViewModel.init(authenticationService:navigationDelegate:)), initParameters: [self.authenticationService(), self.navigationDelegate()])}
    
    public dynamic func opensClicksViewModel() -> Any { return DI.lazySingleton(OpensClicksViewModel.self)}

    // MARK: ViewControllers
    
    public dynamic func loginViewController() -> Any { return DI.defaultWithProperties(LoginViewController.self, properties: ["viewModel" : self.loginViewModel()])}
    
    public dynamic func forgotPasswordViewController() -> Any { return DI.defaultWithProperties(ForgotPasswordViewController.self, properties: ["viewModel" : self.forgotPasswordViewModel()])}

    public dynamic func accountViewController() -> Any { return DI.defaultWithProperties(AccountViewController.self, properties: ["viewModel" : self.accountViewModel()])}

    public dynamic func opensClicksViewController() -> Any { return DI.defaultWithProperties(OpensClicksViewController.self, properties: ["viewModel" : self.opensClicksViewModel()])}
}
