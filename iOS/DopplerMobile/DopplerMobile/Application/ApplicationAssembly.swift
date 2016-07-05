//
//  ApplicationAssembly.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 7/5/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Typhoon

public class ApplicationAssembly: TyphoonAssembly {

    public dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self) {
            (definition) in
            
            definition.injectProperty("loginService", with: self.loginService())
            definition.injectProperty("loginViewController", with: self.rootViewController())
        }
    }
    
    public dynamic func loginService() -> AnyObject {
        return TyphoonDefinition.withClass(LoginService.self)
    }
    
    public dynamic func rootViewController() -> AnyObject {
        return TyphoonDefinition.withClass(LoginViewController.self) {
            (definition) in
            
            definition.injectProperty("loginService", with : self.loginService())
            
            definition.scope = TyphoonScope.Singleton
        }
    }

}