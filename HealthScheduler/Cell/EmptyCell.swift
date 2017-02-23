//
//  EmptyCell.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 20..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class EmptyCell: UITableViewCell {

    @IBOutlet weak var emptyImageView: UIImageView!
    @IBOutlet weak var noHistoryLabel: UILabel!
    @IBOutlet weak var followLabel: UILabel!
    @IBOutlet weak var indicatorButton: UIButton!
    
    
    var timer : Timer!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timer = Timer.scheduledTimer(timeInterval: 1.4, target: self, selector: #selector(blinking), userInfo: nil, repeats: true)
    }

    func blinking() {
        UIButton.animate(withDuration: 0.7, delay : 0.0,
                         options: .allowUserInteraction ,
                         animations: {self.indicatorButton.alpha = CGFloat.init(0)},
                         completion:
            {(finished) in
                UIButton.animate(withDuration: 0.7, delay : 0.0,
                                 options: .allowUserInteraction ,
                                 animations: {self.indicatorButton.alpha = CGFloat.init(1.0)})
        })
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
