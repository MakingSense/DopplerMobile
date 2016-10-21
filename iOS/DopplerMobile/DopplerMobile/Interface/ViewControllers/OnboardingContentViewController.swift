//
//  OnboardingContentViewController.swift
//  DopplerMobile
//
//  Created by Mugu on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

class OnboardingContentViewController: UIViewController
{
    static let identifier = "OnboardingContentViewController"
    
    //MARK: Properties
    @IBOutlet fileprivate weak var txtContent: UILabel!
    @IBOutlet weak var imgContent: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var viewModel : OnboardingContentViewModel?
    weak var delegate: OnboardingContentViewControllerDelegate?
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblTitle.text = self.viewModel!.title
        lblSubTitle.text = self.viewModel?.subtitle
        imgContent.image = getImageFromName(name: self.viewModel!.imageName)
        pageControl.currentPage = self.viewModel!.index //TODO: Refactor Onboarding to proper implement MVVM Pattern.
        
        //TODO: As mentioned above, this needs to be taken in account when refactored to take in account this case.
        
        if(self.viewModel!.index == 2)
        {
            skipButton.isHidden = true
            nextButton.setTitle("ONBOARDING_START_NOW_BUTTON".localized, for: UIControlState.normal)
        }
    }
    
    @IBAction func SkipButtonTouched(_ sender: UIButton)
    {
        delegate?.skipTouched()
    }
    
    @IBAction func NextButtonTouched(_ sender: UIButton)
    {
        delegate?.nextTouched()
    }
    
    func getImageFromName(name: String) -> UIImage
    {
        return UIImage.init(named: name)!
    }
}
