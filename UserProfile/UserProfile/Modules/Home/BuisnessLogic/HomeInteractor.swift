//
//  HomeInteractor.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 24.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import UIKit

class HomeInteractor: NSObject, HomeInteractorProtocol {
    
    var view: HomeVC?
    
    func fillView() {
        let user = UserProvider.sharedInstance.loadUser()
        self.view?.nameLabel.text = user!.name
    }
}
