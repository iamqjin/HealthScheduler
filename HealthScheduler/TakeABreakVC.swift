//
//  TakeABreakVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 16..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit
import AudioToolbox

class TakeABreakVC: UIViewController {
    
    //다음 운동표시
    var nextEx = String()
    
    //쉬는 시간 타이머
    var timer: Timer!
    
    //쉬는 시간 test
    var breakTime = 6000 //(60초)
    var breakTimeFlag = 6000 //기준 시간
    
    @IBOutlet weak var minSecFlagLabel: UILabel!
    @IBOutlet weak var minSecLabel: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var plusSecButton: UIButton!
    @IBOutlet weak var minusSecButton: UIButton!
    
    //쉬는 시간 스킵 액션
    @IBAction func breakSkipAction(_ sender: Any) {
        
        timer.invalidate()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //시간 조절 액션
    @IBAction func controllBreakTime(_ sender: UIButton){
        
        if let plusMinus = sender.title(for: .normal) {
            //10분 미만
            if plusMinus == "+30 seconds" {
                if breakTime + 3000 < 60000 {
                    breakTime += 3000
                    breakTimeFlag += 3000
                }
            }
            if plusMinus == "-30 seconds" {
                if breakTime - 3000 > 0 {
                    breakTime -= 3000
                    breakTimeFlag -= 3000
                }
            }
        }
    }
    
    //배터리 부분 안보이게 감추는 프로퍼티
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //버튼 보더 설정
        plusSecButton.layer.cornerRadius = 3
        plusSecButton.layer.borderWidth = 1
        plusSecButton.layer.borderColor = UIColor(red: 3/255.0, green: 121/255.0, blue: 251/255.0, alpha: 1.0).cgColor
        minusSecButton.layer.cornerRadius = 3
        minusSecButton.layer.borderWidth = 1
        minusSecButton.layer.borderColor = UIColor(red: 3/255.0, green: 121/255.0, blue: 251/255.0, alpha: 1.0).cgColor
        skipButton.layer.cornerRadius = 3
        skipButton.layer.borderWidth = 1
        skipButton.layer.borderColor = UIColor.clear.cgColor
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(breakTimeFunc), userInfo: nil, repeats: true)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    //타이머 함수
    func breakTimeFunc() {
        
        self.breakTime -= 1
        
        let min = (Int(self.breakTime) / 100) / 60 % 60
        let sec = (Int(self.breakTime) / 100) % 60
        let msec = Int(self.breakTime) % 100

        let minF = (Int(self.breakTimeFlag) / 100) / 60 % 60
        let secF = (Int(self.breakTimeFlag) / 100) % 60
        let msecF = Int(self.breakTimeFlag) % 100
        
        let minSecFormat = String(format: "%02d:%02d.%02d",min , sec, msec)
        let minSecFlagFormat = String(format: "%02d:%02d.%02d",minF , secF, msecF)
        
        minSecLabel.text = minSecFormat
        minSecFlagLabel.text = minSecFlagFormat

        if Int(breakTime) == 0 {
            
            breakTime = 6000
            breakTimeFlag = 6000
            
            timer.invalidate()
            
            //자동 해제
            self.presentingViewController?.dismiss(animated: true, completion: {
                () in AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            })
        }
        
    }

}
