//
//  UIViewController+Storyboard.swift
//  LoginTest
//
//  Created by Valentina Chernoeva on 28.03.16.
//  Copyright © 2016 Константин. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let storyboardNameHome = "Home"
    static let storyboardNameProfile = "UserProfile"
    static let storyboardNameChangingPwd = "ChangingPwd"
}

extension UIViewController {
    
    class func instantiateFromStoryboard(storyboardName: String) -> Self {
        return instantiateFromStoryboardHelper(storyboardName)
    }
    
    class private func instantiateFromStoryboardHelper<T>(storyboardName: String) -> T {
            let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
            return storyboard.instantiateViewControllerWithIdentifier(storyboardIdentifier()) as! T
    }
    
    class private func storyboardIdentifier() -> String {
        return String(self)
    }
}
