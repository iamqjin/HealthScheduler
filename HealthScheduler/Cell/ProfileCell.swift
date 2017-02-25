//
//  ProfileCell.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 24..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var historyCount: UILabel!
    
    @IBOutlet weak var totalWeight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
