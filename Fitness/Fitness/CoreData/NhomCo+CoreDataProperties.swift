//
//  NhomCo+CoreDataProperties.swift
//  Fitness
//
//  Created by Duc'sMacBook on 7/2/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//
//

import Foundation
import CoreData


extension NhomCo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NhomCo> {
        return NSFetchRequest<NhomCo>(entityName: "NhomCo")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int16
    @NSManaged public var image: String?

}
