//
//  DI.swift
//  DopplerMobile
//
//  Created by Marcelo Vazquez on 9/27/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import Foundation
import Typhoon

//TODO: [Technical debt] Try to refactor this class into a Fluent Interface pattern

///Summary:
///   Helper methods to register dependencies on App's composition root
class DI
{
    ///Summary:
    ///   Registers a dependency with default scope and custom properties
    ///Parameters:
    ///   clazz: Class to be registered
    ///   properties: Properties to be injected (key = property name, value = object to be injected )
    public static func defaultWithProperties(_ clazz : AnyClass!, properties : [String : Any]) -> Any
    {
        return TyphoonDefinition.withClass(clazz)
        {
            (definition) in
                for property in properties
                {
                    definition!.injectProperty(Selector(property.key), with: property.value)
                }
        }
    }
    
    ///Summary:
    ///   Registers a class with LazySingleton scope
    ///Parameters:
    ///   clazz: Class to be registered
    public static func lazySingleton(_ clazz : AnyClass!) -> Any
    {
        return TyphoonDefinition.withClass(clazz)
        {
            (definition) in
            definition!.scope = TyphoonScope.lazySingleton
        }
    }
    
    ///Summary:
    ///   Registers a class with LazySingleton scope and custom parameters
    ///Parameters:
    ///   clazz: Class to be registered
    ///   selector: Initializer to be used when creating object
    ///   initParameters: Parameters for target initializer
    public static func lazySingleton(_ clazz : AnyClass!, selector: Selector, initParameters: [Any]) -> Any
    {
        return TyphoonDefinition.withClass(clazz)
        {
            (definition) in
            definition!.scope = TyphoonScope.lazySingleton
            definition!.useInitializer(selector)
            {
                (initializer) in
                for parameter in initParameters
                {
                    initializer!.injectParameter(with: parameter)
                }
            }
        }
    }
}
