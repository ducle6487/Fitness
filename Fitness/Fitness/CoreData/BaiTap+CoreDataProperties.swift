//
//  BaiTap+CoreDataProperties.swift
//  
//
//  Created by Duc'sMacBook on 7/11/19.
//
//

import Foundation
import CoreData


extension BaiTap {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BaiTap> {
        return NSFetchRequest<BaiTap>(entityName: "BaiTap")
    }

    @NSManaged public var hinhAnh: String?
    @NSManaged public var huongDan: String?
    @NSManaged public var loaiNhomCo: Int16
    @NSManaged public var moTa: String?
    @NSManaged public var ten: String?
    @NSManaged public var tips: String?
    @NSManaged public var reps: Int16
    @NSManaged public var timeofrep: Int16
    @NSManaged public var timeofrest: Int16

}
