//
//  UserProvider.swift
//  UserProfile
//
//  Created by Valentina Chernoeva on 23.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

import Foundation
import CoreData

class UserProvider {
    
    static let sharedInstance = UserProvider()
    
    var managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
    
    init() {
        managedObjectContext = CoreDataManager.sharedInstance.managedObjectContext
    }
    
    func createUser(userModel: UserModel) -> Bool {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext)
        let user = User(entity:entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        user.name = userModel.name
        user.email = userModel.email
        user.password = userModel.password

        do {
            try managedObjectContext.save()
            print("-- User created! --")
            return true
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
            abort()
        }
        return false
    }
    
    func deleteUser() {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription
        
        do {
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if (result.count == 0) {
                return
            }
            managedObjectContext.deleteObject(result.first as! User)
            try managedObjectContext.save()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
    func updateUserProfile(userModel: UserModel) -> Bool {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription
        
        do {
            let result = try managedObjectContext.executeFetchRequest(fetchRequest) as! [User]
            if (result.count == 0) {
                print("There's no users!")
                return false
            }
            result.first?.name = userModel.name
            result.first?.email = userModel.email
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        do {
            try managedObjectContext.save()
            print("-- User updated! --")
            return true
        } catch let error as NSError {
            print("Could not update \(error), \(error.userInfo)")
        }

        return false
    }
    
    func changePwd(oldPwd: String, newPwd: String) -> Bool {
        
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription
        do {
            let result = try managedObjectContext.executeFetchRequest(fetchRequest) as! [User]
            if (result.count == 0) {
                print("There's no users!")
                return false
            }
            if result.first?.password != oldPwd {
                print("Incorrect the old password!")
                return false
            } else {
                result.first?.password = newPwd
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        do {
            try managedObjectContext.save()
            print("-- Password updated! --")
            return true
        } catch let error as NSError {
            print("Could not update \(error), \(error.userInfo)")
        }
        return false

    }
    
    func loadUser() -> UserModel? {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription
        
        do {
            let result = try managedObjectContext.executeFetchRequest(fetchRequest) as! [User]
            if (result.count == 0) {
                print("\n\nData got empty values")
            } else {
                let user = UserModel()
                user.name = result.first?.name
                user.email = result.first?.email
                user.password = result.first?.password
                return user
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return nil
    }
    
}
