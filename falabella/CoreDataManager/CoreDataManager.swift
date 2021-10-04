//
//  CoreDataManager.swift
//  falabella
//
//  Created by Image Maker on 4/10/21.
//

import Foundation
import UIKit

protocol CoreDataManagerProtocol {
    func getAllItems() -> [UserListItem]
    func createItem(user: String, pass: String)
    func deleteItem(item: UserListItem)
}

class CoreDataManager: CoreDataManagerProtocol {
    
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    init() {
    }
    
    func getAllItems() -> [UserListItem] {
        do {
            var models = [UserListItem]()
            models = try context.fetch(UserListItem.fetchRequest())
            return models
        } catch {
            return []
        }
    }
    
    func createItem(user: String, pass: String) {
        let newItem = UserListItem(context: context)
        newItem.user = user
        newItem.pass = pass
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    func deleteItem(item: UserListItem) {
        context.delete(item)
    }
}
