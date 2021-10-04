//
//  UserListItem+CoreDataProperties.swift
//  
//
//  Created by Image Maker on 4/10/21.
//
//

import Foundation
import CoreData


extension UserListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserListItem> {
        return NSFetchRequest<UserListItem>(entityName: "UserListItem")
    }

    @NSManaged public var user: String?
    @NSManaged public var pass: String?

}
