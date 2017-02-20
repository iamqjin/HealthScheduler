//
//  TrainerCell.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 20..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class TrainerCell: UITableViewCell {
    
    @IBOutlet weak var trainerImage: UIImageView!
    @IBOutlet weak var trainerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        trainerView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        trainerView.layer.cornerRadius = 3.0
        trainerView.layer.masksToBounds = false
        trainerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        trainerView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        trainerView.layer.shadowOpacity = 0.8
        
        trainerImage.layer.borderWidth = 1
        trainerImage.layer.masksToBounds = false
        trainerImage.layer.borderColor = UIColor.clear.cgColor
        trainerImage.layer.cornerRadius = trainerImage.frame.height/2
        trainerImage.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
