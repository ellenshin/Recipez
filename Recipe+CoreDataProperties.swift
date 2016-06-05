//
//  Recipe+CoreDataProperties.swift
//  recipez
//
//  Created by Ellen Shin on 6/1/16.
//  Copyright © 2016 Ellen Shin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe {

    @NSManaged var title: String?
    @NSManaged var image: NSData?
    @NSManaged var steps: String?
    @NSManaged var ingredients: String?

}
