//
//  OnboardingOverlay.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 10/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import SwiftyOnboard
import UIKit
import Bond
import ReactiveKit

extension SwiftyOnboardOverlay {
    
    var pageControlY: CGFloat { return 48 }
    var butonMargin: CGFloat { return 20 }
    var buttonFontSize: CGFloat { return 18 }

    override open func layoutSubviews() {
        super.layoutSubviews()
        bindViews()

        pageControl.currentPageIndicatorTintColor = UIColor.green()
        pageControl.frame.origin.y = pageControlY
        
        skipButton.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        skipButton.titleLabel?.font = UIFont.boldOf(size: buttonFontSize)
        skipButton.sizeToFit()
        skipButton.frame.origin.x = butonMargin

        continueButton.setTitleColor(UIColor.green(), for: UIControlState.normal)
        continueButton.titleLabel?.font = UIFont.boldOf(size: buttonFontSize)
        continueButton.frame.origin.y = skipButton.frame.origin.y
        updateNextButton()
    }
    
    private func bindViews() {
        // Skip button bindings
        let currentPage: DynamicSubject2<Int, NoError> = pageControl.reactive.keyPath("currentPage", ofType: Int.self)
        currentPage.map { return $0 == OnboardingViewDataSource.lastPage }.bind(to: skipButton.reactive.isHidden)
        let skipButtonTitle = Observable<String>("SKIP".localizedUppercase)
        skipButtonTitle.bind(to: skipButton.reactive.title)

        // Next button bindings
        currentPage.map { return $0 == OnboardingViewDataSource.lastPage ? "START NOW!".localizedUppercase : "NEXT".localizedUppercase }
            .observeNext { [weak self] title in
                guard let strongSelf = self else {
                    return
                }
                // As we can't change UIButton's type, we need this to prevent animation on title change
                UIView.performWithoutAnimation {
                    strongSelf.continueButton.setTitle(title, for: .normal)
                    strongSelf.continueButton.layoutIfNeeded()
                    strongSelf.updateNextButton()
                }
            }.dispose(in: reactive.bag)
    }
    
    private func updateNextButton() {
        continueButton.sizeToFit()
        continueButton.frame.origin.x = bounds.width - continueButton.bounds.width - butonMargin
    }
}
