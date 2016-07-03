//
//  DelegateCommand.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/29/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public class DelegateCommand : Command
{
    private var canExecuteMethod : () -> Bool
    private var executeMethod : () -> ()
    
    init(execute: () -> (), canExecute: () -> Bool)
    {
        self.executeMethod = execute;
        self.canExecuteMethod = canExecute;
    }
    
    convenience init(execute: () -> ())
    {
        self.init(execute: execute, canExecute: { return true })
    }
    
    public func canExecute() -> Bool
    {
        return self.canExecuteMethod()
    }
    
    public func execute()
    {
        self.executeMethod()
    }
}