//
//  ForgotPasswordViewModel.swift
//  DopplerMobile
//
//  Created by MMaldini on 30/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit

@objc class ForgotPasswordViewModel: NSObject {
    
    private let authenticationService: AuthenticationService!
    private let navigationDelegate: NavigationDelegate!
    
    let username = Observable<String?>("")
    let password = Observable<String?>("")
    let isBusy = Observable<Bool>(false)
    
    var requestCanExecute: Signal<Bool, NoError> {
        return combineLatest(username, password) { user, pass in
            return !user!.isEmpty && !pass!.isEmpty
        }
    }
    
    dynamic init(authenticationService: AuthenticationService, navigationDelegate: NavigationDelegate) {
        self.navigationDelegate = navigationDelegate
        self.authenticationService = authenticationService
        super.init()
        self.setupNotifications()
    }
    
    private func setupNotifications() {
        // MARK - Login finished notification
        NotificationCenter
            .default
            .reactive
            .notification(name: NSNotification.Name(rawValue: NotificationIdentifier.ForgotPasswordNotification.rawValue))
            .observeNext { [weak self] notification in
                guard let strongSelf = self else {
                    return
                }
                defer {
                    strongSelf.isBusy.value = false
                }
                guard let errorMessage = notification.object else {
                    strongSelf.navigationDelegate?.showViewModel(SegueIdentifier.ForgotPasswordScreenSegue)
                    return
                }
                // TODO: Implement a generic way to show pretty error messages
                debugPrint(errorMessage)
            }
            .dispose(in: reactive.bag)
    }
    
    //TODO: Implement this method.
    func forgotPassword() {
        
    }
}
