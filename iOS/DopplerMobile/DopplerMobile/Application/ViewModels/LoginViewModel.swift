//
//  LoginViewModel.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit

@objc class LoginViewModel: NSObject {
    
    private let loginService: LoginService!
    private let navigationDelegate: NavigationDelegate!
    
    let username = Observable<String?>("")
    let password = Observable<String?>("")
    let isBusy = Observable<Bool>(false)
    
    var loginCanExecute: Signal<Bool, NoError> {
        return combineLatest(username, password) { user, pass in
            return !user!.isEmpty && !pass!.isEmpty
        }
    }
    
    dynamic init(loginService: LoginService, navigationDelegate: NavigationDelegate) {
        self.navigationDelegate = navigationDelegate
        self.loginService = loginService
        super.init()
        self.setupNotifications()
    }
    
    private func setupNotifications() {
        // MARK - Login finished notification
        NotificationCenter
            .default
            .reactive
            .notification(name: NSNotification.Name(rawValue: NotificationIdentifier.LoginNotification.rawValue))
            .observeNext { [weak self] notification in
                guard let strongSelf = self else {
                    return
                }
                defer {
                    strongSelf.isBusy.value = false
                }
                guard let errorMessage = notification.object else {
                    strongSelf.navigationDelegate?.showViewModel(SegueIdentifier.LoggedInScreenSegue)
                    return
                }
                // TODO: Implement a generic way to show pretty error messages
                debugPrint(errorMessage)
            }
            .dispose(in: reactive.bag)
    }
    
    func login() {
        isBusy.value = true
        loginService.login(self.username.value!, password: self.password.value!)
    }
    
    func forgotPassword() {
        UIApplication.shared.open(URL(string:"https://app2.fromdoppler.com/")!, options: [:], completionHandler: nil)
    }
}
