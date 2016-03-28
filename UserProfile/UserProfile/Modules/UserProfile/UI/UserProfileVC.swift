//
//  UserProfileVC.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 24.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {
    
    var navigation : UserProfileWireframe?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func onTapSaveButton(sender: AnyObject) {
        
    }
    
    @IBAction func onTapBackButton(sender: AnyObject) {
        navigation?.dismissProfileScreen()
    }
    
// MARK: UITextFieldDelegate
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if (textField == self.passwordTextField) {
            navigation?.presentChangingPwdScreen()
        }
        return true
    }
}
