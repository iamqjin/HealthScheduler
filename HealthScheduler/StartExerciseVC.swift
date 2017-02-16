//
//  StartExerciseVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 14..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation
import UIKit


class StartExerciseVC: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource {

    //타이머 생성
    var timer: Timer!
    
    //시작 날짜
    let formatter = DateFormatter()
    let formatterToday = DateFormatter()
    var startTime = String()
    var endTime = String()
    var today = String()
    
    
    //운동별 세트 수를 받음
    var setNumList = [Int]()
    
    var setStartFlag = 0
    var setEndFlag = Int()
    
    var exStartFlag = Int()
    var exEndFlag = Int()
    
    //운동기록
    var exLog = [String]()
    
    //쉬는 시간 설정 초
    var breakTime = 60.00
    
    //선택된 테이블 indexPath받아옴
    var scheduleNum : IndexPath!
    
    //무게 단위 설정
    //true kg / false lbs
    var weightUnit = true
    
    //무게와 횟수 기본값 설정
//    var defaultWeight = "1kg"
//    var defaultCount = "1회"
    
    var totalWeight = String()
    var totalCount = String()
    
    //디폴트 모델 생성
    var defaultModel = DefaultModel()
    var weightKg = [String]()
    var weightLbs = [String]()
    var count = [String]()
    
    //데이터 test
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var exList = [Exercise]()
    
    //모든 운동 세트 리스트
    var allExSetList = [ExSet]()
    
    @IBOutlet var startExView: UIView!
    @IBOutlet weak var exDetailLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var passButton: UIButton!
    @IBOutlet weak var setDetailPickerView: UIPickerView!
    @IBOutlet weak var exEndButton: UIButton!
    
    //운동 성공 버튼 액션
    @IBAction func passAction(_ sender: Any) {
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTimerCode), userInfo: nil, repeats: true)
        
        passButton.isEnabled = false
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //스케줄 운동 내역을 받아옴
        exList = appDelegate.scheduleList[scheduleNum.row].exerciseList
        
        //피커뷰 지정자 보이게하기
        setDetailPickerView.showsSelectionIndicator = true
        
        //모든 세트들 받은 배열로생성
        for ex in exList {
            for exSet in ex.exSetList {
                allExSetList.append(exSet)
            }
        }
        
        print("모든 운동세트 리스트",allExSetList)
        
        
        
        //설정 무게 변경시 배열 변경
        weightKg = defaultModel.returnWeightKg()
        weightLbs = defaultModel.returnWeightLbs()
        count = defaultModel.returnCount()
        
        
        //운동 종료 버튼
        exEndButton.isHidden = true
        exEndButton.isEnabled = false
        
        timeLabel.text = String(format: "%02d:%02d.%02d")
        
        //운동 리스트의 세트 수를 배열로 받는다.
        for i in appDelegate.scheduleList[scheduleNum.row].exerciseList{
            setNumList.append(i.exSetCount!)
        }
        
        print("세트 리스트들",setNumList)
        
        //더블 탭 기능 삽입
        //더블 탭 제스처 추가
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        startExView.addGestureRecognizer(tap)
        
        
        
        //스와이프 test
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        startExView.addGestureRecognizer(rightSwipe)
        startExView.addGestureRecognizer(leftSwipe)
        
        
        //선택된 테이블 뷰 인덱스 값
        if let selectedScheduleNum = scheduleNum {
            print("넘어온index", selectedScheduleNum)
            
            //처음 운동 첫세트 보여줌
            if selectedScheduleNum.section == 0 {
                exDetailLabel.text = allExSetList[setStartFlag].exTitle! + " " +  String(allExSetList[setStartFlag].setId! + 1) + " 세트"
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //시작 날짜 및 시간
        let startDate = Date()
        formatter.amSymbol = "오전"
        formatter.pmSymbol = "오후"
        formatter.dateFormat = "a hh:mm"
        formatterToday.dateFormat = "yyyy년 MM월 dd일 EE요일"
        startTime = formatter.string(from: startDate)
        today = formatterToday.string(from: startDate)
        
        print("시작",startTime,today)
    }
    
    
    //더블 탭 test -> 세트1단계 완료했다는 뜻
    func doubleTapped() {
        print("나 두번 클릭됨")
        
        if setStartFlag < allExSetList.count {
            exDetailLabel.text = allExSetList[setStartFlag].exTitle! + " " +  String(allExSetList[setStartFlag].setId! + 1) + " 세트"
            allExSetList[setStartFlag].passOrFail = "OK"
            
            
            print("피커선택된 무게인덱스", setDetailPickerView.selectedRow(inComponent: 0))
            print("피커선택된 횟수인덱스", setDetailPickerView.selectedRow(inComponent: 1))

            //단위 별 저장 값다르게
            if weightUnit {
                allExSetList[setStartFlag].weight = weightKg[setDetailPickerView.selectedRow(inComponent: 0)]
            } else {
                allExSetList[setStartFlag].weight = weightLbs[setDetailPickerView.selectedRow(inComponent: 0)]
            }
            //선택되있는 횟수 저장
            allExSetList[setStartFlag].count = count[setDetailPickerView.selectedRow(inComponent: 1)]
            
           setStartFlag += 1
            
            if setStartFlag == allExSetList.count {
                print("운동 완료")
                
                exEndButton.isHidden = false
                exEndButton.isEnabled = true
                setDetailPickerView.isExclusiveTouch = true
                setDetailPickerView.isHidden = true
                for i in allExSetList {
                    
                    print("\(i.exTitle)의 \(i.setId) 세트의 무게 : \(i.weight) 횟수 : \(i.count) 성공여부 : \(i.passOrFail)")
                    
                    exLog.append("\(i.setId! + 1). \(i.exTitle!) \(i.weight!) x \(i.count!) | \(i.passOrFail!)")
                    
                }
                
                //다시 터치되도 어떠한 작동이 안일어나게
                setStartFlag = allExSetList.count + 1
            }
        }
    }
    
    //스와이프 test
    func swiped(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                //성공
            case UISwipeGestureRecognizerDirection.right:
                
                
                print("Swiped right")
                
                //실패 or 뒤로 가기
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
            default :
                print("디폴트")
            }
        }
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
    
    
    //타이머 타켓 함수
    func runTimerCode() {
        breakTime -= 60
        let min = Int(breakTime) / 60 % 60
        let sec = Int(breakTime) % 60
        let msec = (Int(breakTime) * 100) % 100
        let timerFormat = String(format: "%02d:%02d.%02d",min , sec, msec)
        
        //타이머 포맷 작성
        timeLabel.text = timerFormat
        
        if breakTime == 0.00 {
            timer.invalidate()
            
            let timeOver = UIAlertAction(title: "확인", style: .default, handler: nil)
            let alert = UIAlertController(title: "", message: "쉬는 시간 끝 \n 다시 운동 시작", preferredStyle: .alert)
            
            alert.addAction(timeOver)
            //breakTime 재설정
            breakTime = 60.00
            
            self.present(alert, animated: true, completion: {
                //버튼 다시 활성화
                () in self.passButton.isEnabled = true
                
            })
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "endExSegue" {
            
            //끝나는 시간 측정
            let endDate = Date()
            endTime = formatter.string(from: endDate)
            print("끝",endTime)

            let destinationVC = segue.destination as! EndExerciseVC
            
            destinationVC.today = self.today
            destinationVC.startTime = self.startTime
            destinationVC.endTime = self.endTime
            destinationVC.exLog = self.exLog
            destinationVC.finalHistory = self.allExSetList
        }
        
        
    }
    
    
}
