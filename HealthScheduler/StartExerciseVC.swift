//
//  StartExerciseVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 14..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class StartExerciseVC: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource {

    //타이머 생성
    var timer: Timer!
    
    //쉬는 시간 설정
    var breakTime = 60
    
    //선택된 테이블 indexPath받아옴
    var scheduleNum : IndexPath?
    
    //무게 단위 설정
//    var weightUnitKg = "kg"
//    var weightUnitPd = "lbs"
    //true kg / false lbs
    var weightUnit = true
    
    //무게와 횟수 기본값 설정
    var defaultWeight = "1"
    var defaultCount = "1"
    
    
    var totalWeight = String()
    var totalCount = String()

    
    //설정 무게 변경시 배열 변경
    var weightKg = ["1kg", "2kg", "3kg", "4kg", "5kg", "6kg", "7kg", "8kg", "9kg", "10kg", "11kg", "12kg", "13kg", "14kg", "15kg", "16kg", "17kg", "18kg", "19kg", "20kg", "21kg", "22kg", "23kg", "24kg", "25kg", "26kg", "27kg", "28kg", "29kg", "30kg", "31kg", "32kg", "33kg", "34kg", "35kg", "36kg", "37kg", "38kg", "39kg", "40kg", "41kg", "42kg", "43kg", "44kg", "45kg", "46kg", "47kg", "48kg", "49kg", "50kg", "51kg", "52kg", "53kg", "54kg", "55kg", "56kg", "57kg", "58kg", "59kg", "60kg", "61kg", "62kg", "63kg", "64kg", "65kg", "66kg", "67kg", "68kg", "69kg", "70kg", "71kg", "72kg", "73kg", "74kg", "75kg", "76kg", "77kg", "78kg", "79kg", "80kg", "81kg", "82kg", "83kg", "84kg", "85kg", "86kg", "87kg", "88kg", "89kg", "90kg", "91kg", "92kg", "93kg", "94kg", "95kg", "96kg", "97kg", "98kg", "99kg", "100kg"]
    
    var weightLbs = ["1lbs", "2lbs", "3lbs", "4lbs", "5lbs", "6lbs", "7lbs", "8lbs", "9lbs", "10lbs", "11lbs", "12lbs", "13lbs", "14lbs", "15lbs", "16lbs", "17lbs", "18lbs", "19lbs", "20lbs", "21lbs", "22lbs", "23lbs", "24lbs", "25lbs", "26lbs", "27lbs", "28lbs", "29lbs", "30lbs", "31lbs", "32lbs", "33lbs", "34lbs", "35lbs", "36lbs", "37lbs", "38lbs", "39lbs", "40lbs", "41lbs", "42lbs", "43lbs", "44lbs", "45lbs", "46lbs", "47lbs", "48lbs", "49lbs", "50lbs", "51lbs", "52lbs", "53lbs", "54lbs", "55lbs", "56lbs", "57lbs", "58lbs", "59lbs", "60lbs", "61lbs", "62lbs", "63lbs", "64lbs", "65lbs", "66lbs", "67lbs", "68lbs", "69lbs", "70lbs", "71lbs", "72lbs", "73lbs", "74lbs", "75lbs", "76lbs", "77lbs", "78lbs", "79lbs", "80lbs", "81lbs", "82lbs", "83lbs", "84lbs", "85lbs", "86lbs", "87lbs", "88lbs", "89lbs", "90lbs", "91lbs", "92lbs", "93lbs", "94lbs", "95lbs", "96lbs", "97lbs", "98lbs", "99lbs", "100lbs"]

    
    var count = ["1회", "2회", "3회", "4회", "5회", "6회", "7회", "8회", "9회", "10회", "11회", "12회", "13회", "14회", "15회", "16회", "17회", "18회", "19회", "20회", "21회", "22회", "23회", "24회", "25회", "26회", "27회", "28회", "29회", "30회", "31회", "32회", "33회", "34회", "35회", "36회", "37회", "38회", "39회", "40회", "41회", "42회", "43회", "44회", "45회", "46회", "47회", "48회", "49회", "50회", "51회", "52회", "53회", "54회", "55회", "56회", "57회", "58회", "59회", "60회", "61회", "62회", "63회", "64회", "65회", "66회", "67회", "68회", "69회", "70회", "71회", "72회", "73회", "74회", "75회", "76회", "77회", "78회", "79회", "80회", "81회", "82회", "83회", "84회", "85회", "86회", "87회", "88회", "89회", "90회", "91회", "92회", "93회", "94회", "95회", "96회", "97회", "98회", "99회", "100회"]
    
    //데이터 test
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet var startExView: UIView!
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
        
        //더블 탭 test
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        startExView.addGestureRecognizer(tap)
        
        
        //디폴트 운동 & 횟수 설정
        totalWeight = defaultWeight
        totalCount = defaultCount
        
        //선택된 테이블 뷰 인덱스 값
        if let selectedScheduleNum = scheduleNum {
            exDetailLabel.text = String(describing: selectedScheduleNum)
        }
        
        timeLabel.text = String(format: "%02d:%02d")
        
    }
    
    //
    func doubleTapped() {
        print("나 두번 클릭됨")
    }
    
    //pickerView 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            //단위별 피커뷰 설정
            if weightUnit {
                return weightKg[row]
            } else {
                return weightLbs[row]
            }
            
        } else {
            return count[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            //단위별 피커뷰 설정
            if weightUnit {
                return weightKg.count
            } else {
                return weightLbs.count
            }
        } else {
            return count.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if component == 0 {
            //단위별 피커뷰 설정
            if weightUnit {
                totalWeight = weightKg[row]
            } else {
               totalWeight = weightLbs[row]
            }
        } else {
            totalCount = count[row]
        }
        
        exDetailLabel.text = totalWeight + " x " + totalCount
        
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
