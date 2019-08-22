//
//  NhomCo+CoreDataClass.swift
//  Fitness
//
//  Created by Duc'sMacBook on 7/2/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(NhomCo)
public class NhomCo: NSManagedObject {

}


extension NSManagedObject {
    class var context: NSManagedObjectContext! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class var request: NSFetchRequest<NSManagedObject> {
        return NSFetchRequest(entityName: String(describing: self))
    }
    
    func save(success: (() -> Void)? , fail: ((Error) -> Void)?){
        guard let context = self.managedObjectContext else {
            fail?(NSError(domain: "", code: 1, userInfo: nil))
            return
        }
        if context.hasChanges {
            do {
                try context.save()
                success?()
            } catch{
                fail?(error)
            }
        }else {
            let error = NSError(domain: "Data Not Change", code: 0, userInfo: nil)
            fail?(error)
        }
    }
    
    func delete(complete: ((Error?) -> Void)?){
        self.managedObjectContext?.delete(self)
        self.save(success: {
            complete?(nil)
        }) { (Error) in
            complete?(Error)
        }
    }
    
    class func all(success: (([NSManagedObject]) -> Void)?, fail: ((Error) -> Void)?) {
        do {
            let result = try context.fetch(request)
            success?(result)
        } catch {
            fail?(error)
        }
    }
    
    class func getByCause(predicate: NSPredicate?, success: ((NSManagedObject?) -> Void)?, fail: ((Error) -> Void)?){
        request.predicate = predicate
        do {
            let result = try context.fetch(request)
            success?(result.first)
        } catch {
            fail?(error)
        }
    }
}
