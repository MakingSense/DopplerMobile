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
    @IBOutlet private weak var txtContent: UILabel!
    var viewModel : OnboardingContentViewModel?
    weak var delegate: OnboardingContentViewControllerDelegate?
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        txtContent.text = self.viewModel!.content
    }
    
    @IBAction func SkipButtonTouched(sender: UIButton)
    {
        delegate?.skipTouched()
    }
    
    @IBAction func NextButtonTouched(sender: UIButton)
    {
        delegate?.nextTouched()
    }
}
