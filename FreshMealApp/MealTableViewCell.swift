//
//  MealTableViewCell.swift
//  MealCollectionDemo
//
//  Created by KSHRD on 11/23/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailImageHeightConstrant: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //Border radius
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
        
        //border
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
    }
    
    func configurCell(with meal: Meal){
        titleLabel.text = meal.title
        shortDescriptionLabel.text = meal.short_description
        thumbnailImageView.image = UIImage(data: meal.image!)
        
        if let image = thumbnailImageView.image{
            let aspect = image.size.height / image.size.width
            thumbnailImageHeightConstrant.constant = containerView.frame.size.width*aspect
        }
    }
}
