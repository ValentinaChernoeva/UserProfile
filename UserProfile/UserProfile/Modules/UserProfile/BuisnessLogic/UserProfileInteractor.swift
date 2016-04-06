//
//  UserProfileInteractor.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 24.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import UIKit

class UserProfileInteractor: NSObject, UserProfileInteractorProtocol {
    
    var view: UserProfileVC?
    
    func fillView() {
        let user = UserProvider.sharedInstance.loadUser()
        self.view?.nameTextField.text = user!.name
        self.view?.emailTextField.text = user!.email
        self.view?.passwordTextField.text = user!.password
    }
    
    func updateUserProfile() -> Bool {
        let updatedUser = UserModel()
        updatedUser.name = self.view?.nameTextField.text
        updatedUser.email = self.view?.emailTextField.text
        return UserProvider.sharedInstance.updateUserProfile(updatedUser)
    }
    
}
