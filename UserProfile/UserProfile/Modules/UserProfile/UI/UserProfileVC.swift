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
    var interactor : UserProfileInteractor?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.fillView()
    }
    
    @IBAction func onTapSaveButton(sender: AnyObject) {
        if interactor?.updateUserProfile() == true {
            self.navigation?.dismissProfileScreen()
        }
    }
    
    @IBAction func onTapBackButton(sender: AnyObject) {
        navigation?.dismissProfileScreen()
    }
    
    @IBAction func ontapChangePwdButton(sender: UIButton) {
        navigation?.presentChangingPwdScreen()
    }
    
}
