//
//  Recipe.swift
//  recipez
//
//  Created by Ellen Shin on 6/1/16.
//  Copyright © 2016 Ellen Shin. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Recipe: NSManagedObject {
    
    func setRecipeImg(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getRecipeImg() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

    
}
