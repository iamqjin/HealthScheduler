//
//  AddExerciseCell.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 10..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class AddExerciseCell: UITableViewCell {

    //운동 타이틀 아울렛
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var exNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
