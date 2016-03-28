//
//  UserProfileWireframe.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 24.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import UIKit

class UserProfileWireframe: NSObject, UserProfileWireframeProtocol {
    
    var profileVC: UserProfileVC?
    
    func presentChangingPwdScreen() {
        let changingPwdVC = ChangingPwdVC.instantiateFromStoryboard(Constants.storyboardNameChangingPwd)
        changingPwdVC.navigation = ChangingPwdWireframe()
        changingPwdVC.navigation?.changingPwdVC = changingPwdVC
        self.profileVC?.presentViewController(changingPwdVC, animated: true, completion: nil);
    }
    
    func dismissProfileScreen() {
        self.profileVC?.dismissViewControllerAnimated(true, completion: nil)
    }
}
