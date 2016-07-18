//
//  OnboardingContentViewController.swift
//  DopplerMobile
//
//  Created by Mugu on 6/22/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

//TODO: This should be a separated file later.
protocol OnboardingContentViewControllerDelegate: class
{
    func nextTouched()
    func skipTouched()
}

class OnboardingContentViewController: UIViewController
{
    @IBOutlet weak var txtContent: UILabel!

    var viewModel : OnboardingContentViewModel?

    weak var delegate: OnboardingContentViewControllerDelegate?

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
