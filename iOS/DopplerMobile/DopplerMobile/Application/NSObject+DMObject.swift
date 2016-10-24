//
//  NSObject+DMObject.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 25/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation

public extension NSObject
{
    func setAssociatedObject(_ value: AnyObject?, associativeKey: UnsafeRawPointer, policy: objc_AssociationPolicy)
    {
        if let valueAsAnyObject = value
        {
            objc_setAssociatedObject(self, associativeKey, valueAsAnyObject, policy)
        }
    }
    
    func getAssociatedObject(_ associativeKey: UnsafeRawPointer) -> Any?
    {
        guard let valueAsType = objc_getAssociatedObject(self, associativeKey) else
        {
            return nil
        }
        return valueAsType
    }
}
