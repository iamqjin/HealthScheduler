//
//  StartExerciseVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 14..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class StartExerciseVC: UIViewController {

    var timer: Timer!
    var breakTime = 60
    
    @IBOutlet weak var exDetailLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var passButton: UIButton!
    
    @IBOutlet weak var failButton: UIButton!
    
    @IBAction func passAction(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimerCode), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func failAction(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = String(format: "%02d:%02d")
        
        
    }
    
    func runTimerCode() {
        breakTime -= 10
        let min = Int(breakTime) / 60 % 60
        let sec = Int(breakTime) % 60
        let timerFormat = String(format: "%02d:%02d",min , sec)
        
        //타이머 포맷 작성
        timeLabel.text = timerFormat
        
        if breakTime == 0 {
            timer.invalidate()
            
            let timeOver = UIAlertAction(title: "확인", style: .default, handler: nil)
            let alert = UIAlertController(title: "", message: "쉬는 시간 끝", preferredStyle: .alert)
            alert.addAction(timeOver)
            //breakTime 재설정
            breakTime = 60
            print(breakTime)
            self.present(alert, animated: true, completion: nil)
        }
    }

}
