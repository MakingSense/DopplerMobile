//
//  InProgressViewModel.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 5/26/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond
import UIKit

struct InProgressViewModel {
    
    let gif = Observable<UIImage?>(UIImage.gif(name: Gifs.inProgress.rawValue))
    let textDescription = Observable<String>("IN_PROGRESS_TEXT".localized)
}
