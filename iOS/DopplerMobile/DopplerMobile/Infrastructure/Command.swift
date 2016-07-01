//
//  Command.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/29/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public protocol CommandDelegate
{
    func canExecuteChanged(canExecute: Bool)
}

public protocol Command
{
    var delegate: CommandDelegate? {get set}
    
    func canExecute() -> Bool
    
    func execute()
    
    func raiseCanExecuteChanged()
}

