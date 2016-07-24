//
//  ApplicationAssembly.swift
//  DopplerMobile
//
//  Created by Marcelo Vazquez on 7/24/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Typhoon

public class ApplicationAssembly : TyphoonAssembly
{
    
    public dynamic func appDelegate() -> AnyObject
    {
        return TyphoonDefinition.withClass(AppDelegate.self)
        {
            (definition) in
            definition.scope = TyphoonScope.LazySingleton
        }
    }
    
    // MARK: Services
    
    public dynamic func	loginService() -> AnyObject
    {
        return TyphoonDefinition.withClass(LoginService.self)
        {
            (definition) in
            definition.scope = TyphoonScope.LazySingleton
        }
    }
    
    // MARK: ViewModels
    
    public dynamic func loginViewModel() -> AnyObject
    {
        return TyphoonDefinition.withClass(LoginViewModel.self) {
            (definition) in
            
            definition.useInitializer(#selector(LoginViewModel.init(loginService:nagivationDelegate:))) {
                (initializer) in
                
                initializer.injectParameterWith(self.loginService())
                initializer.injectParameterWith(self.navigationDelegate())
            }
        }
    }
    
    // MARK: Navigation
    
    public dynamic func navigationDelegate() -> AnyObject
    {
        return TyphoonDefinition.withClass(NavigationHandler.self)
        {
            (definition) in
            
            definition.useInitializer(#selector(NavigationHandler.init(appDelegate:)))
            {
                (initializer) in
                initializer.injectParameterWith(self.appDelegate())
                definition.scope = TyphoonScope.LazySingleton
            }
        }
    }
    
    // MARK: ViewControllers
    
    public dynamic func loginViewController() -> AnyObject
    {
        return TyphoonDefinition.withClass(LoginViewController.self) {
            (definition) in
            definition.injectProperty("loginViewModel", with: self.loginViewModel() )
        }
    }
}