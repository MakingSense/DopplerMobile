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
    
    var viewModel : OnboardingContentViewModel?
    weak var delegate: OnboardingContentViewControllerDelegate?
    
    // MARK: Actions
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblTitle.text = self.viewModel!.title
        lblSubTitle.text = self.viewModel?.subtitle
        imgContent.image = getImageFromName(name: self.viewModel!.imageName)
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
