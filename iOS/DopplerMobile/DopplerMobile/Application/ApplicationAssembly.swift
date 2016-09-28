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
    
    public dynamic func loginService() -> Any { return DI.lazySingleton(LoginService.self) }
    
    // MARK: ViewModels
    
    public dynamic func loginViewModel() -> Any { return DI.lazySingleton(LoginViewModel.self, selector: #selector(LoginViewModel.init(loginService:nagivationDelegate:)), initParameters: [self.loginService(), self.navigationDelegate()])}

    // MARK: ViewControllers
    
    public dynamic func loginViewController() -> Any { return DI.defaultWithProperties(LoginViewController.self, properties: ["loginViewModel" : self.loginViewModel()])}
}

