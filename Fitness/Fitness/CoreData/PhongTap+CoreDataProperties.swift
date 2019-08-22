//
//  PhongTap+CoreDataProperties.swift
//  Fitness
//
//  Created by Duc'sMacBook on 7/3/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//
//

import Foundation
import CoreData


extension PhongTap {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhongTap> {
        return NSFetchRequest<PhongTap>(entityName: "PhongTap")
    }

    @NSManaged public var id: Int16
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var timeopen: String?
    @NSManaged public var danhgia: Float
    @NSManaged public var mota: String?
    @NSManaged public var lat: Double
    @NSManaged public var long: Double
    @NSManaged public var phone: String?

}
