//
//  CreateRecipeVC.swift
//  recipez
//
//  Created by Ellen Shin on 6/1/16.
//  Copyright © 2016 Ellen Shin. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var ingredientsField: UITextField!
    @IBOutlet weak var stepsField: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!

    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        recipeImg.layer.cornerRadius = 4.0
        recipeImg.clipsToBounds = true

    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImg.image = image
    }
    
    
    @IBAction func addBtnPressed(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createRecipe(sender: AnyObject) {
        
        if let title = titleField.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            recipe.title = titleField.text
            recipe.steps = stepsField.text
            recipe.ingredients = ingredientsField.text
            recipe.setRecipeImg(recipeImg.image!)
            
            context.insertObject(recipe)
            
            do {
                try context.save()
            } catch {
                print("Could not save the recipe.")
            }
        }
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    
}
