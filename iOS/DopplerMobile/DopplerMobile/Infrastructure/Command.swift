//
//  Command.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/29/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public protocol Command
{
    func canExecute()-> Bool
    
    func execute()
}

