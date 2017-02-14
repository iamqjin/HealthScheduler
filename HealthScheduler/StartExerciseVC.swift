//
//  StartExerciseVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 14..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class StartExerciseVC: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource {

    var timer: Timer!
    
    //쉬는 시간 설정
    var breakTime = 60
    
    //무게 단위 설정
    var weightUnitKg = "kg"
    var weightUnitPd = "lbs"
    
    //무게와 횟수 기본값 설정
    var defaultWeight = "1"
    var defaultCount = "1"
    
    
    var totalWeight = String()
    var totalCount = String()

    
    //설정 무게 변경시 배열 변경
    var weight = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"]
    var count = ["1회", "2회", "3회", "4회", "5회", "6회", "7회", "8회", "9회", "10회", "11회", "12회", "13회", "14회", "15회", "16회", "17회", "18회", "19회", "20회", "21회", "22회", "23회", "24회", "25회", "26회", "27회", "28회", "29회", "30회", "31회", "32회", "33회", "34회", "35회", "36회", "37회", "38회", "39회", "40회", "41회", "42회", "43회", "44회", "45회", "46회", "47회", "48회", "49회", "50회", "51회", "52회", "53회", "54회", "55회", "56회", "57회", "58회", "59회", "60회", "61회", "62회", "63회", "64회", "65회", "66회", "67회", "68회", "69회", "70회", "71회", "72회", "73회", "74회", "75회", "76회", "77회", "78회", "79회", "80회", "81회", "82회", "83회", "84회", "85회", "86회", "87회", "88회", "89회", "90회", "91회", "92회", "93회", "94회", "95회", "96회", "97회", "98회", "99회", "100회"]
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet weak var exDetailLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var passButton: UIButton!
    @IBOutlet weak var failButton: UIButton!
    
    @IBOutlet weak var setDetailPickerView: UIPickerView!
    
    //운동 성공 버튼 액션
    @IBAction func passAction(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimerCode), userInfo: nil, repeats: true)
        
        passButton.isEnabled = false
        failButton.isEnabled = false
    }
    
    //운동 실패 버튼 액션
    @IBAction func failAction(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimerCode), userInfo: nil, repeats: true)
        
        failButton.isEnabled = false
        passButton.isEnabled = false
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalWeight = defaultWeight
        totalCount = defaultCount
//        appDelegate.scheduleList[selectedSchedule]
        timeLabel.text = String(format: "%02d:%02d")
    }
    
    
    //pickerView 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return weight[row]
            
        } else {
            return count[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return weight.count
        } else {
            return count.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if component == 0 {
          totalWeight = weight[row]
        } else {
            totalCount = count[row]
        }
        
        exDetailLabel.text = totalWeight + weightUnitKg + " x " + totalCount
        
    }
    
    
    
    
    
    //타이머 타켓 함수
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
            let alert = UIAlertController(title: "", message: "쉬는 시간 끝 \n 다시 운동 시작", preferredStyle: .alert)
            
            alert.addAction(timeOver)
            //breakTime 재설정
            breakTime = 60
            
            self.present(alert, animated: true, completion: {
                //버튼 다시 활성화
                () in self.passButton.isEnabled = true
                self.failButton.isEnabled = true
            })
            
        }
    }

}
