//
//  OnboardingViewDataSource.swift
//  DopplerMobile
//
//  Created by Marcelo Vazquez on 7/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import SwiftyOnboard
import Bond

class OnboardingViewDataSource : NSObject, SwiftyOnboardDataSource, NavigationDelegate {

    static let lastPage = 2
    private let viewModels : [OnboardingContentViewModel]
    
    private weak var parentViewController: UIViewController?
    
    init(_ parentViewController: UIViewController) {
        self.viewModels = [OnboardingContentViewModel(title: "ONBOARDING_ONE_TITLE".localized.replacingOccurrences(of: "{username}", with: Defaults[.username]!), subtitle: "ONBOARDING_ONE_SUBTITLE".localized, imageName: "Onboarding-1"),
                       OnboardingContentViewModel(title: "ONBOARDING_TWO_TITLE".localized, subtitle: "ONBOARDING_TWO_SUBTITLE".localized, imageName: "Onboarding-2"),
                       OnboardingContentViewModel(title: "ONBOARDING_THREE_TITLE".localized, subtitle: "ONBOARDING_THREE_SUBTITLE".localized, imageName: "Onboarding-3")]
        self.parentViewController = parentViewController
    }
    
    func swiftyOnboardBackgroundColorFor(_ swiftyOnboard: SwiftyOnboard, atIndex index: Int) -> UIColor? {
        return UIColor.white()
    }
    
    func swiftyOnboardNumberOfPages(_ swiftyOnboard: SwiftyOnboard) -> Int {
        return viewModels.count
    }
    
    func swiftyOnboardPageForIndex(_ swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
        return getViewFromViewModel(viewModels[index])
    }
    
    func swiftyOnboardViewForOverlay(_ swiftyOnboard: SwiftyOnboard) -> SwiftyOnboardOverlay? {
        let overlay = SwiftyOnboardOverlay()
        overlay.skipButton.reactive.tap
            .observeNext { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.skipTouched()
            }.dispose(in: reactive.bag)
        overlay.continueButton.reactive.tap
            .observeNext { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                if swiftyOnboard.currentPage == strongSelf.viewModels.count - 1 {
                    strongSelf.skipTouched()
                } else {
                    swiftyOnboard.goToPage(index: swiftyOnboard.currentPage + 1, animated: true)
                }
            }.dispose(in: reactive.bag)
        return overlay
    }
    
    private func skipTouched() {
        showViewModel(SegueIdentifier.DashboardScreenSegue)
    }
    
    // TODO: Is it the best place to call the callbacks? just to be consistent.
    func showViewModel(_ identifier: String) {
        parentViewController?.performSegue(withIdentifier: identifier, sender : self)
    }
    
    private func getViewFromViewModel(_ viewModel: OnboardingContentViewModel) -> SwiftyOnboardPage {
        let page = SwiftyOnboardPage()
        viewModel.title.bind(to: page.title)
        viewModel.subtitle.bind(to: page.subTitle)
        viewModel.imageName.map{ return UIImage.init(named: $0) }.bind(to: page.imageView)
        return page
    }
    
}
