//
//  HomeVC.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 24.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var navigation : HomeWireframe?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigation = HomeWireframe()
        self.navigation?.homeVC = self
    }
    
    @IBAction func onTapUserProfileButton(sender: AnyObject) {
        self.navigation?.presentUserProfileScreen()
    }

}
