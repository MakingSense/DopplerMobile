//
//  MSButton.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 7/1/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit

open class MSButton: UIButton, CommandDelegate
{
    var command : Command?
        {
        didSet
        {
            if (self.command != nil)
            {
                self.isEnabled = self.command!.canExecute()
                self.command!.delegate = self
            }
        }
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?)
    {
        self.command!.execute()
        super.touchesBegan(touches!, with:event)
    }
    
    open func canExecuteChanged(_ canExecute: Bool)
    {
        self.isEnabled = canExecute
    }
}
