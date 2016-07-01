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

    var index: Int = 0
    var hasLazyLoading: Bool?
    var lazyContent: String?
    var lazyIndex: Int?
    var viewModel : OnboardingContentViewModel?
    weak var delegate: OnboardingContentViewControllerDelegate?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        txtContent.text = self.viewModel!.content
    }

    init(viewModel: OnboardingContentViewModel)
    {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    func setupViewModel(viewModel: OnboardingContentViewModel)
    {
        self.viewModel = viewModel
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
