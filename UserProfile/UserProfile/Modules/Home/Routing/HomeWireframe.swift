//
//  HomeWireframe.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 24.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import UIKit

class HomeWireframe: NSObject, HomeWireframeProtocol {
    
    var homeVC : HomeVC?
    
    func presentUserProfileScreen() {
        let profileVC = UserProfileVC.instantiateFromStoryboard(Constants.storyboardNameProfile)
        profileVC.navigation = UserProfileWireframe()
        profileVC.navigation?.profileVC = profileVC
        self.homeVC?.presentViewController(profileVC, animated: true, completion: nil)
    }
}
