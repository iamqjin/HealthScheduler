//
//  HistoryCell.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    @IBOutlet weak var backgroundCardView: UIView!
    @IBOutlet weak var scheduleTitle: UILabel!
    @IBOutlet weak var scheduleDate: UILabel!
    @IBOutlet weak var exLog: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundCardView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        backgroundCardView.layer.cornerRadius = 3.0
        backgroundCardView.layer.masksToBounds = false
        
        backgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        backgroundCardView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        backgroundCardView.layer.shadowOpacity = 0.8
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
