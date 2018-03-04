//
//  AddEditMealTableViewController.swift
//  FreshMealApp
//
//  Created by KSHRD on 12/6/17.
//  Copyright © 2017 Kokpheng. All rights reserved.
//

import UIKit

class AddEditMealTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //Test Commit
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var shortDescriptionTextField: UITextField!
    @IBOutlet weak var longDescriptionTextView: UITextView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var addEditMealNavigationBar: UINavigationItem!
    
    let imagePicker = UIImagePickerController()
    var service = MealService ()
    var mealHolder: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCornerRadius(view: longDescriptionTextView)
        setupViewCornerRadius(view: thumbnailImageView)
        setUpNavigationBar()
        
        imagePicker.delegate = self
        if mealHolder != nil {
            titleTextField.text = mealHolder?.title
            shortDescriptionTextField.text = mealHolder?.short_description
            longDescriptionTextView.text = mealHolder?.long_description
            thumbnailImageView.image = UIImage(data: (mealHolder?.image)!)
        }
      
    }
    func setUpNavigationBar(){
        if #available(iOS 11.0, *) {
            addEditMealNavigationBar.largeTitleDisplayMode = .never
        }
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
    }
    func setupViewCornerRadius(view: UIView) {
        
        let layer = view.layer
        // Corner
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        // Border
        layer.borderColor = #colorLiteral(red: 0.5676869154, green: 0.7538596988, blue: 0.1165765896, alpha: 1)
        layer.borderWidth = 1
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let imageData = UIImageJPEGRepresentation(thumbnailImageView.image!, 1.0)
        //Edit Screen
        if self.mealHolder != nil{
            mealHolder?.title =  titleTextField.text
            mealHolder?.short_description = shortDescriptionTextField.text
            mealHolder?.long_description =  longDescriptionTextView.text
            mealHolder?.image = imageData
            service.update(updateMeal: mealHolder!)
        } else{
           _ =  service.create(title: titleTextField.text!, shortDesription: shortDescriptionTextField.text!, logDescription: longDescriptionTextView.text!, thumImage: imageData!)
            service.saveChange()
        }
        
        
        print(#function)
        
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        print(#function)
    }
    @IBAction func browserImage(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
         print(#function)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            thumbnailImageView.contentMode = .scaleAspectFit
            thumbnailImageView.image = pickedImage
        }
         dismiss(animated: true, completion: nil)
         print(#function)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
         print(#function)
    }
   
}



