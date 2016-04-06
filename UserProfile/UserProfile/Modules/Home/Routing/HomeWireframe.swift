//
//  HomeWireframe.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 24.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import UIKit

class HomeWireframe: NSObject, HomeWireframeProtocol {
    
    var window : UIWindow?
    var homeVC : HomeVC?
    
    func presentHomeVCInWindow() {
        self.homeVC = HomeVC.instantiateFromStoryboard(Constants.storyboardNameHome)
        self.homeVC?.navigation = self
        self.homeVC?.interactor = HomeInteractor()
        self.homeVC?.interactor?.view = self.homeVC
        self.window!.rootViewController = self.homeVC
        self.window!.makeKeyAndVisible()
    }
    
    func presentUserProfileScreen() {
        let profileVC = UserProfileVC.instantiateFromStoryboard(Constants.storyboardNameProfile)
        profileVC.navigation = UserProfileWireframe()
        profileVC.navigation?.profileVC = profileVC
        profileVC.interactor = UserProfileInteractor()
        profileVC.interactor?.view = profileVC
        
        self.homeVC?.presentViewController(profileVC, animated: true, completion: nil)
    }
}
