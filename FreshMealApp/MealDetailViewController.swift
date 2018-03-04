//
//  MealDetailViewController.swift
//  FreshMealApp
//
//  Created by Ron Rith on 12/10/17.
//  Copyright © 2017 Kokpheng. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {
    @IBOutlet var mealImageView: UIImageView!
    @IBOutlet var mealShortDescLabel: UILabel!
    @IBOutlet var mealLongDescLabel: UILabel!
    @IBOutlet var mealTitleLable: UILabel!
    @IBOutlet var mealCategoryLabel: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var thumbnailImageHeightConstraint: NSLayoutConstraint!
    
    var mealHolder:Meal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setupContainerView()
        prepareData()

    }
    func setUpNavigationBar(){
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .automatic
        }
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
    }
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }
    
    func setupContainerView() {
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
        
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
    }
    
    func prepareData() {
        if let meal = self.mealHolder{
            title = meal.title
            
            mealTitleLable.text = meal.title
            mealShortDescLabel.text = meal.short_description
            mealLongDescLabel.text = meal.long_description
            mealImageView.image = UIImage(data: meal.image!)
            
            if let image = mealImageView.image {
                let aspect = image.size.height / image.size.width
                thumbnailImageHeightConstraint.constant = view.frame.size.width * aspect
            }
        }
        
    }

    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if let image = mealImageView.image {
            // Calculate aspect
            let aspect = image.size.height / image.size.width
            
            thumbnailImageHeightConstraint.constant = view.frame.size.width * aspect
        }
    }

    @IBOutlet var Back: UIButton!
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
