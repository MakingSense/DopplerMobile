//
//  TableViewCellProtocol.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 30/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

protocol TableViewCellProtocol: class {
    func configure<T>(viewModel: T)
}



