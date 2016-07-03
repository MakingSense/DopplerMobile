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

public class OnboardingContentViewController: UIViewController
{
    @IBOutlet weak var txtContent: UILabel!

    var index: Int = 0
    var hasLazyLoading: Bool?
    var lazyContent: String?
    var lazyIndex: Int?
    weak var delegate: OnboardingContentViewControllerDelegate?

    override public func viewDidLoad()
    {
        super.viewDidLoad()

        if(hasLazyLoading!)
        {
            lazySetupView()
        }
    }


    public func setupView(content: String, index: Int)
    {
        if(txtContent != nil)
        {
            txtContent.text = content
            self.index = index //Not sure if we should use caps for parameters or if using self like in this case it's OK. [Mugu]
        }
        else
        {
            lazyContent = content;
            lazyIndex = index;
            hasLazyLoading = true;
        }
    }

    func lazySetupView()
    {
        txtContent.text = lazyContent
        index = lazyIndex!
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
