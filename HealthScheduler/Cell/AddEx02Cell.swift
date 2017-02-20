
//
//  AddEx02Cell.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 10..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

protocol zeroExceptionDelegate {
    func zeroAlertAction()
    func checkSetCount(setCount : Int, tagNum : Int)
}

class AddEx02Cell: UITableViewCell {

    @IBOutlet weak var selectedExLabel: UILabel!
    @IBOutlet weak var setCountLabel: UILabel!
    @IBOutlet weak var addEx02Button: UIButton!
    @IBOutlet weak var minusEx02Button: UIButton!
    @IBOutlet weak var exOrderLabel: UILabel!
    @IBOutlet weak var setView: UIView!
    
    
    var tagNum : Int?
    var defaultSetNum = 3
    var delegate : zeroExceptionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        setView.layer.cornerRadius = 3.0
        setView.layer.masksToBounds = false
        setView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        setView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        setView.layer.shadowOpacity = 0.8
        addEx02Button.layer.cornerRadius = 3.0
        addEx02Button.layer.borderWidth = 1.0
        addEx02Button.layer.borderColor = UIColor(red: 3/255.0, green: 121/255.0, blue: 251/255.0, alpha: 1.0).cgColor
        minusEx02Button.layer.cornerRadius = 3.0
        minusEx02Button.layer.borderWidth = 1.0
        minusEx02Button.layer.borderColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0).cgColor
        setCountLabel.text = "\(defaultSetNum)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func addSetAction() {
        
        defaultSetNum += 1
        setCountLabel.text = "\(defaultSetNum)"
        //세트수 체크
        delegate?.checkSetCount(setCount: defaultSetNum, tagNum : self.tagNum!)
    }
    
    @IBAction func minusSetAction() {

        defaultSetNum -= 1

        //0으로 내려갔을시 다시 올리고 델리게이트 맡김
        if defaultSetNum == 0 {
            delegate?.zeroAlertAction()
            defaultSetNum += 1
        }
        
        setCountLabel.text = "\(defaultSetNum)"
        //세트수 체크
        delegate?.checkSetCount(setCount: defaultSetNum, tagNum : self.tagNum!)
    }
}
