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
    var interactor : HomeInteractor?
    
    @IBOutlet weak var nameLabel: UILabel!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.fillView()
    }
    
    @IBAction func onTapUserProfileButton(sender: AnyObject) {
        self.navigation?.presentUserProfileScreen()
    }

}
