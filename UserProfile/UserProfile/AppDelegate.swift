//
//  AppDelegate.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 23.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let userProvider = UserProvider.sharedInstance
        if userProvider.loadUser() != nil {
            userProvider.deleteUser()
        } else {
            let user = UserModel()
            user.name = "Valua"
            user.email = "myEmail"
            user.password = "123"
            userProvider.createUser(user)
        }
        return true
    }

    
}

