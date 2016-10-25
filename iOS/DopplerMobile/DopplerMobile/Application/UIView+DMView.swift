//
//  UIView+DMView.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 25/10/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//
import UIKit

fileprivate var ActivityIndicatorViewAssociativeKey = "ActivityIndicatorViewAssociativeKey"
public extension UIView {
    var activityIndicatorView: UIActivityIndicatorView
        {
        get {
            if let activityIndicatorView = getAssociatedObject(&ActivityIndicatorViewAssociativeKey) as? UIActivityIndicatorView
            {
                return activityIndicatorView
            }
            else
            {
                let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                activityIndicatorView.activityIndicatorViewStyle = .gray
                activityIndicatorView.color = .gray
                activityIndicatorView.center = center
                activityIndicatorView.hidesWhenStopped = true
                addSubview(activityIndicatorView)
                setAssociatedObject(activityIndicatorView, associativeKey: &ActivityIndicatorViewAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return activityIndicatorView
            }
        }
        
        set {
            addSubview(newValue)
            setAssociatedObject(newValue, associativeKey:&ActivityIndicatorViewAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
