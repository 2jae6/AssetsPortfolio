//
//  Assets+CoreDataProperties.swift
//  
//
//  Created by WooKoo on 2023/04/11.
//
//

import Foundation
import CoreData


extension Assets {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Assets> {
        return NSFetchRequest<Assets>(entityName: "Assets")
    }

    @NSManaged public var type: String?
    @NSManaged public var value: Float
    @NSManaged public var name: String?
    @NSManaged public var note: String?

}
