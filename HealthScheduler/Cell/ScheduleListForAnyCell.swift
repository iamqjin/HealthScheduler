//
//  ScheduleListForAnyCell.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 20..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class ScheduleListForAnyCell: UITableViewCell {

    @IBOutlet weak var scheduleTitleLabel : UILabel!
    @IBOutlet weak var exListLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
