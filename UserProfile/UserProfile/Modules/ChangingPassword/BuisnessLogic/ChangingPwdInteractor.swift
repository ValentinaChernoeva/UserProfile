//
//  ChangingPwdInteractor.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 24.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import UIKit

class ChangingPwdInteractor: NSObject, ChangingPwdInteractorProtocol {
    
    var view: ChangingPwdVC?
    
    func changePassword() -> Bool {
        let oldPwd = self.view?.oldPwdTextField.text
        let newPwd = self.view?.newPwdTextField.text
        return UserProvider.sharedInstance.changePwd(oldPwd!, newPwd: newPwd!)
    }
}
