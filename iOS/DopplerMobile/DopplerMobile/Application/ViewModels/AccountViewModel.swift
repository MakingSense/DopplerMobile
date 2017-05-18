//
//  AccountViewModel.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 16/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond

class AccountViewModel: NSObject {

    private let authenticationService: AuthenticationService!
    private let navigationDelegate: NavigationDelegate!

    let companyEmail: Observable<String>
    let companyName: Observable<String>
    let accountType: Observable<String>
    let username: Observable<String>
    let avatar: URL
    
    dynamic init(authenticationService: AuthenticationService, navigationDelegate: NavigationDelegate) {
        self.authenticationService = authenticationService
        self.navigationDelegate = navigationDelegate
        self.companyEmail = Observable<String>(authenticationService.getCompanyEmail()!)
        self.companyName = Observable<String>(authenticationService.getCompanyName()!)
        self.accountType = Observable<String>(authenticationService.getAccountType()!)
        self.username = Observable<String>(authenticationService.getUsername()!)
        self.avatar = URL(string: "http://mhalabs.org/wp-content/uploads/upme/1451456913_brodie.jpg")!
    }
    
    func showPreferences() {
        // TODO: Show preferences
    }
    
    func logout() {
        authenticationService.logout()
        navigationDelegate.showViewModel(SegueIdentifier.LogoutSegue)
    }
}
