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
    {
        set
        {
            self.delegate = newValue
        }
        
        get
        {
            return self.delegate
        }
    }
    
    private var canExecuteMethod: () -> Bool
    private var executeMethod: () -> ()
    private var _canExecute: Bool
    
    init(execute: () -> (), canExecute: () -> Bool)
    {
        self.executeMethod = execute;
        self.canExecuteMethod = canExecute;
        self._canExecute = false
    }
    
    convenience init(execute: () -> ())
    {
        self.init(execute: execute, canExecute: { return true })
    }
    
    public func canExecute() -> Bool
    {
        self._canExecute = self.canExecuteMethod()
        return self._canExecute
    }
    
    public func execute()
    {
        self.executeMethod()
    }
    
    public func raiseCanExecuteChanged()
    {
        let canExecuteOld = self._canExecute
        self.canExecute()
        if (self._canExecute != canExecuteOld)
        {
            self.delegate?.canExecuteChanged(self._canExecute)
        }
    }
}