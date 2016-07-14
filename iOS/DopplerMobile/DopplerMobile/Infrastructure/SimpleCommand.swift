//
//  SimpleCommand.swift
//  DopplerMobile
//
//  Created by Julian Waimann on 6/29/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

public class SimpleCommand : Command
{
    public var delegate: CommandDelegate?
    private var canExecuteMethod: () -> Bool
    private var executeMethod: () -> ()
    private var _canExecute: Bool
    
    init(execute: () -> (), canExecute: () -> Bool)
    {
        self.executeMethod = execute;
        self.canExecuteMethod = canExecute;
        self._canExecute = self.canExecuteMethod()
    }
    
    convenience init(execute: () -> ())
    {
        self.init(execute: execute, canExecute: { return true })
    }
    
    public func canExecute() -> Bool
    {
        return self._canExecute
    }
    
    public func execute()
    {
        self.executeMethod()
    }
    
    public func raiseCanExecuteChanged()
    {
        let canExecuteOld = self._canExecute
        self._canExecute = self.canExecuteMethod()
        if (self._canExecute != canExecuteOld)
        {
            self.delegate?.canExecuteChanged(self._canExecute)
        }
    }
}