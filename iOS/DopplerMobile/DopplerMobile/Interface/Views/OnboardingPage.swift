//
//  OnboardingPage.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 9/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import SwiftyOnboard
import UIKit

extension SwiftyOnboardPage {
    
    var titleFontSize: CGFloat { return 26 }
    var titleY: CGFloat { return 80 }
    var titleHeight: CGFloat { return 60 }
    var subtitleFontSize: CGFloat { return 18 }

    override open func layoutSubviews() {
        super.layoutSubviews()
        
        let scaling = self.bounds.width / self.imageView.image!.size.width
        let imageHeight = self.imageView.image!.size.height * scaling
        imageView.frame = CGRect(x: 0, y: self.bounds.height - imageHeight, width: self.bounds.width, height: imageHeight)
        
        title.font = UIFont.boldOf(size: titleFontSize)
        title.textColor = UIColor.primaryDark()
        title.frame.origin.y = titleY
        title.frame.size.height = titleHeight
        
        subTitle.font = UIFont.regularOf(size: subtitleFontSize)
        subTitle.textColor = UIColor.primaryDark()
        subTitle.frame.origin.y = title.frame.origin.y + title.bounds.height
    }
    
}
