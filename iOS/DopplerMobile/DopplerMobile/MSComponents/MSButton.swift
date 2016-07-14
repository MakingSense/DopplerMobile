//
//  MSButton.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 7/1/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

public class MSButton: UIButton, CommandDelegate
{
    var command : Command?
        {
        didSet
        {
            if (self.command != nil)
            {
                self.enabled = self.command!.canExecute()
                self.command!.delegate = self
            }
        }
    }
    
    override public func touchesBegan(touches: Set<UITouch>?, withEvent event: UIEvent?)
    {
        self.command!.execute()
        super.touchesBegan(touches!, withEvent:event)
    }
    
    public func canExecuteChanged(canExecute: Bool)
    {
        self.enabled = canExecute
    }
}