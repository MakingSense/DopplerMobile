//
//  MSButton.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 7/1/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import UIKit

public class MSButton: UIButton, CommandDelegate
{
    var command : Command? {
        set {
            self.command = newValue
            if (self.command != nil)
            {
                self.enabled = self.command!.canExecute()
                self.command!.delegate = self
            }            
        }
        get {
            return self.command
        }
    }
    
    public func canExecute() -> Bool
    {
        return self.command == nil ? true : self.command!.canExecute()
    }
    
    public func execute()
    {
        self.command?.execute()
    }
    
    public func getEnable() -> Bool
    {
        return self.command == nil ? self.enabled : self.command!.canExecute()
    }
 
    public func canExecuteChanged(canExecute: Bool)
    {
        self.enabled = canExecute
    }

}