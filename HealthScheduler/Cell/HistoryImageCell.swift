//
//  HistoryImageCell.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 15..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class HistoryImageCell: UITableViewCell {

    
    @IBOutlet weak var scheduleTitle: UILabel!
    @IBOutlet weak var scheduleDate: UILabel!
    @IBOutlet weak var exLog: UILabel!
    @IBOutlet weak var historyImageView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
