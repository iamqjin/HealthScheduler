//
//  TakeABreakVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 16..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class TakeABreakVC: UIViewController {
    
    //다음 운동표시
    var nextEx = String()
    
    //쉬는 시간 타이머
    var timer: Timer!
    
    //쉬는 시간 test
    var breakTime = 5.0
    
    @IBOutlet weak var minSecLabel: UILabel!
    @IBOutlet weak var breakSkipButton: UIButton!
    
    //쉬는 시간 스킵 액션
    @IBAction func breakSkipAction(_ sender: Any) {
        
        timer.invalidate()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(breakTimeFunc), userInfo: nil, repeats: true)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    //타이머 함수
    func breakTimeFunc() {
        
        self.breakTime -= 0.01
        let min = Int(self.breakTime) / 60 % 60
        let sec = Int(self.breakTime) % 60
        let msec = Int(self.breakTime * 100) % 100
        
        let minSecFormat = String(format: "%02d:%02d.%02d",min , sec, msec)
        
        minSecLabel.text = minSecFormat

        if Int(breakTime) == 0 {
            
            minSecLabel.text = String(format: "%02d:%02d.%02d")
            breakTime = 60.0
            
            timer.invalidate()
        }
        
    }

}
