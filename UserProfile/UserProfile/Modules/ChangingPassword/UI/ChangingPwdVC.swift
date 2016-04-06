//
//  ChangingPwdVC.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 24.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import UIKit

class ChangingPwdVC: UIViewController {
    
    var navigation : ChangingPwdWireframe?
    var interactor : ChangingPwdInteractor?
    
    @IBOutlet weak var oldPwdTextField: UITextField!
    @IBOutlet weak var newPwdTextField: UITextField!
    
    @IBAction func onTapSaveButton(sender: AnyObject) {
        if interactor?.changePassword() == true {
            self.navigation?.dismissChangingPwdScreen()
        }
    }
    
    @IBAction func onTapBackButton(sender: AnyObject) {
        self.navigation?.dismissChangingPwdScreen()
    }
}
