//
//  SimpleCommand.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/29/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

open class SimpleCommand : Command
{
    open var delegate: CommandDelegate?
    fileprivate var canExecuteMethod: () -> Bool
    fileprivate var executeMethod: () -> ()
    fileprivate var _canExecute: Bool
    
    init(execute: @escaping () -> (), canExecute: @escaping () -> Bool)
    {
        self.executeMethod = execute;
        self.canExecuteMethod = canExecute;
        self._canExecute = self.canExecuteMethod()
    }
    
    convenience init(execute: @escaping () -> ())
    {
        self.init(execute: execute, canExecute: { return true })
    }
    
    open func canExecute() -> Bool
    {
        return self._canExecute
    }
    
    open func execute()
    {
        self.executeMethod()
    }
    
    open func raiseCanExecuteChanged()
    {
        let canExecuteOld = self._canExecute
        self._canExecute = self.canExecuteMethod()
        if (self._canExecute != canExecuteOld)
        {
            self.delegate?.canExecuteChanged(self._canExecute)
        }
    }
}
