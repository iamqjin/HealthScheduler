//
//  ScheduleListForClientCell.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 21..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class ScheduleListForClientCell: UITableViewCell {

    @IBOutlet weak var trainerImageView: UIImageView!
    @IBOutlet weak var tScheduleTitleLabel: UILabel!
    @IBOutlet weak var tScheduleDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
