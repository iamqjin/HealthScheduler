//
//  HeaderTableViewCell.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 7..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit
protocol HeaderTableViewCellDelegate {
    func addSet()
}

class HeaderTableViewCell: UITableViewCell {
    
    var delegate : HeaderTableViewCellDelegate?
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBAction func addAction(_ sender: Any) {
        delegate?.addSet()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
