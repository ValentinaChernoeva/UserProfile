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
    let homeWireframe = HomeWireframe()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let userProvider = UserProvider.sharedInstance
        if userProvider.loadUser() == nil {
            let user = UserModel()
            user.name = "Valua"
            user.email = "myEmail"
            user.password = "123"
            userProvider.createUser(user)
        }
        self.homeWireframe.window = self.window
        self.homeWireframe.presentHomeVCInWindow()
        
        return true
    }

    
}

