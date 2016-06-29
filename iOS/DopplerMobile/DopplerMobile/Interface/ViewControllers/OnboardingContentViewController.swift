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
    var viewModel : OnboardingContentViewModel
    weak var delegate: OnboardingContentViewControllerDelegate?

    override public func viewDidLoad()
    {
        super.viewDidLoad()


    }

    override public func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        txtContent.text = self.viewModel.content
    }


//    public func setupView(content: String, index: Int)
//    {
//        if(txtContent != nil)
//        {
//            txtContent.text = content
//            self.index = index //Not sure if we should use caps for parameters or if using self like in this case it's OK. [Mugu]
//        }
//        else
//        {
//            lazyContent = content;
//            lazyIndex = index;
//            hasLazyLoading = true;
//        }
//    }


    public init(viewModel: OnboardingContentViewModel, nibName: String)
    {
        self.viewModel = viewModel

        super.init(nibName: nibName, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
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
