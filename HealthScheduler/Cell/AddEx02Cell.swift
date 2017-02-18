
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

    var tagNum : Int?
    var defaultSetNum = 3
    var delegate : zeroExceptionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCountLabel.text = "세트 수(\(defaultSetNum))"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func addSetAction() {
        
        defaultSetNum += 1
        setCountLabel.text = "세트 수(\(defaultSetNum))"
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
        
        setCountLabel.text = "세트 수(\(defaultSetNum))"
        //세트수 체크
        delegate?.checkSetCount(setCount: defaultSetNum, tagNum : self.tagNum!)
    }
}
