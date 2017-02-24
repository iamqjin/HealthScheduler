//
//  T_StartExerciseVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 21..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class T_StartExerciseVC: UIViewController {

    //타이머 생성
    var timer: Timer!
    
    //시작 날짜
    let formatter = DateFormatter()
    let formatterToday = DateFormatter()
    var startTime = String()
    var endTime = String()
    var today = String()
    
    //스케줄 타이틀
    var scheduleTitle = String()
    
    //운동별 세트 수를 받음
    var setNumList = [Int]()
    
    var setStartFlag = 0
    
    //운동기록
    var exLog = [String]()
    
    //운동 시작 토탈 시간
    var totalTime = 0 //기준(0초)
    
    //총 몇분인지
    var totalTimeMin = String()
    
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
    
    //test
    var exCount = [Int]()
    var exKg = [Int]()
    var exPassOrFail = [String]()
    
    
    //데이터 test
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //모든 운동 세트 리스트
    var exList = [TExercise]()
    
    
    
    @IBOutlet weak var successView: UIView!
    @IBOutlet weak var passOrFailImageView: UIImageView!
    @IBOutlet var startExView: UIView!
    @IBOutlet weak var exDetailLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var exEndButton: UIButton!
    @IBOutlet weak var breakTimeSwitch: UISwitch!
    @IBOutlet weak var passOrFailInfoLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    
    @IBAction func cancelAction(_ sender: Any) {
        let stop = UIAlertAction(title: "정지", style: .destructive){(_) in self.cancelEx()}
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let alert = UIAlertController(title: "STOP", message: "운동을 정지하시겠습니까?", preferredStyle: .alert)
        
        alert.addAction(stop)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func cancelEx(){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //배터리 부분 안보이게 감추는 프로퍼티
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //성공버튼
        successView.alpha = 0
        
        //버튼 둥그렇게
        exEndButton.layer.cornerRadius = 3
        exEndButton.layer.borderWidth = 1
        exEndButton.layer.borderColor = UIColor(red: 3/255.0, green: 121/255.0, blue: 251/255.0, alpha: 1.0).cgColor
        
        
        //운동 시간 타이머 설정
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
        
        
        
        //스케줄 운동 내역을 받아옴
        exList = appDelegate.tScheduleList[scheduleNum.row].exerciseList
        
        print("모든 운동세트 리스트",exList)
        
        //운동 종료 버튼
        exEndButton.isHidden = true
        exEndButton.isEnabled = false
        
        timeLabel.text = String(format: "%02d:%02d:%02d")
        
        
        //스케줄 타이틀 설정
        self.scheduleTitle = appDelegate.tScheduleList[scheduleNum.row].title!
        
        //더블 탭 기능 삽입
        //더블 탭 제스처 추가
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        startExView.addGestureRecognizer(tap)
        
        //실패의 스와이프
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        startExView.addGestureRecognizer(leftSwipe)
        
        
        //선택된 테이블 뷰 인덱스 값
        if let selectedScheduleNum = scheduleNum {
            print("넘어온index", selectedScheduleNum)
            
            //처음 운동 첫세트 보여줌
            if selectedScheduleNum.section == 1 {
                exDetailLabel.text = exList[setStartFlag].name! + " " +  String(exList[setStartFlag].id! + 1) + " 세트"
                countLabel.text = exList[setStartFlag].count!
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //네비게이션바 안보이게
        self.navigationController?.isNavigationBarHidden = true
        
        
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

        guard setStartFlag < exList.count + 5 else {
            return
        }
        
        exList[setStartFlag].passOrFail = "성공"
        
        //운동 넘기기
        setStartFlag += 1
        
        if setStartFlag < exList.count {
            
            exDetailLabel.text = exList[setStartFlag].name! + " " +  String(exList[setStartFlag].id! + 1) + " 세트"
            countLabel.text = exList[setStartFlag].count!
            
            //성공이미지 및 코멘트
            passOrFailInfoLabel.text = "성공!"
            passOrFailImageView.image = #imageLiteral(resourceName: "success")
            successView.fadeIn(completion: {
                (finished: Bool) -> Void in
                self.successView.fadeOut()
            })
        
            
            if breakTimeSwitch.isOn == true {
                //휴식창 띄우기
                self.performSegue(withIdentifier: "takeABreakSegue", sender: self)
            }
        } else {
            print("운동 완료")
            exDetailLabel.text = "Well Done"
            countLabel.text = ""
            exEndButton.isHidden = false
            exEndButton.isEnabled = true
            
            //운동 로그 기록
//            for i in exList {
//                exLog.append("\(i.id! + 1). \(i.name!) \(i.weight!) x \(i.count!) | \(i.passOrFail!)")
//            }
            
            //운동 로그 기록
            for i in exList {
                exKg.append(Int((i.weight?.components(separatedBy: "kg")[0])!)!)
                exCount.append(Int((i.count?.components(separatedBy: "회")[0])!)!)
                exPassOrFail.append(i.passOrFail!)
            }
            
            //이쁜 스트링 테스트
            for i in 0..<exList.count {
                if i == 0 { exLog.append(exList[i].name! + "\n\n" + "\(exList[i].id! + 1). \(exList[i].weight!) x \(exList[i].count!)    \t\t\t\t\t\t \(exList[i].passOrFail!)") }
                else if exList[i-1].name != exList[i].name {
                    exLog.append("\n" + exList[i].name! + "\n\n" + "\(exList[i].id! + 1). \(exList[i].weight!) x \(exList[i].count!)    \t\t\t\t\t\t \(exList[i].passOrFail!)")
                } else {
                    exLog.append("\(exList[i].id! + 1). \(exList[i].weight!) x \(exList[i].count!)    \t\t\t\t\t\t \(exList[i].passOrFail!)")
                }
            }
            //다시 터치되도 어떠한 작동이 안일어나게
            setStartFlag = exList.count + 10
            
            //타이머 종료
            timer.invalidate()
        }
    }
    
    //실패 스와이프
    func swiped(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            if swipeGesture.direction == UISwipeGestureRecognizerDirection.left {
                //실패
                exList[setStartFlag].passOrFail = "실패"
                
                //운동 넘기기
                setStartFlag += 1
                
                if setStartFlag < exList.count {
                    
                    exDetailLabel.text = exList[setStartFlag].name! + " " +  String(exList[setStartFlag].id! + 1) + " 세트"
                    countLabel.text = exList[setStartFlag].count!
                    
                    //실패이미지 띄움
                    passOrFailInfoLabel.text = "괜찮아요!"
                    passOrFailImageView.image = #imageLiteral(resourceName: "thatokBlack")
                    
                    successView.fadeIn(completion: {
                        (finished: Bool) -> Void in
                        self.successView.fadeOut()
                    })
                    
                    
                    if breakTimeSwitch.isOn == true {
                        //휴식창 띄우기
                        self.performSegue(withIdentifier: "takeABreakSegue", sender: self)
                    }
                } else {
                    print("운동 완료")
                    exDetailLabel.text = "Well Done"
                    countLabel.text = ""
                    exEndButton.isHidden = false
                    exEndButton.isEnabled = true
                    
                    //운동 로그 기록
                    for i in exList {
                        exKg.append(Int((i.weight?.components(separatedBy: "kg")[0])!)!)
                        exCount.append(Int((i.count?.components(separatedBy: "회")[0])!)!)
                        exPassOrFail.append(i.passOrFail!)
                    }
                    
                    //이쁜 스트링 테스트
                    for i in 0..<exList.count {
                        if i == 0 { exLog.append(exList[i].name! + "\n\n" + "\(exList[i].id! + 1). \(exList[i].weight!) x \(exList[i].count!)    \t\t\t\t\t\t \(exList[i].passOrFail!)") }
                        else if exList[i-1].name != exList[i].name {
                            exLog.append("\n" + exList[i].name! + "\n\n" + "\(exList[i].id! + 1). \(exList[i].weight!) x \(exList[i].count!)    \t\t\t\t\t\t \(exList[i].passOrFail!)")
                        } else {
                            exLog.append("\(exList[i].id! + 1). \(exList[i].weight!) x \(exList[i].count!)    \t\t\t\t\t\t \(exList[i].passOrFail!)")
                        }
                    }
                    
                    //다시 터치되도 어떠한 작동이 안일어나게
                    setStartFlag = exList.count + 10
                    
                    //타이머 종료
                    timer.invalidate()
                }
            }
        }
    }
    

    
    //운동 타이머
    func startTimer() {
        
        self.totalTime += 1
        
        //24시간 넘어가면 타이머 자동 정지
        if self.totalTime == 86400 { timer.invalidate() }
        
        //totalTime 1초기준
        let hour = self.totalTime / 3600 % 24 //24시간
        let min = self.totalTime / 60 % 60
        let sec = self.totalTime % 60
        
        let timerFormat = String(format: "%02d:%02d:%02d",hour, min, sec)
        timeLabel.text = timerFormat
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "endTrainerExSegue" {
            
            //끝나는 시간 측정
            let endDate = Date()
            endTime = formatter.string(from: endDate)
            print("끝",endTime)
            
            //종료된 시간 측정
            //60초 미만일시 초 단위로 보냄 아니면 분단위
            if self.totalTime < 60 {
                totalTimeMin = String(totalTime) + "초"
            } else {
                totalTimeMin = String(totalTime / 60 % 60) + "분"
            }
            
            
            let destinationVC = segue.destination as! EndExerciseVC
            
            destinationVC.totalTimeMinOrSec = self.totalTimeMin
            destinationVC.today = self.today
            destinationVC.startTime = self.startTime
            destinationVC.endTime = self.endTime
            destinationVC.exLog = self.exLog
            destinationVC.scheduleTitle = self.scheduleTitle
            //test
            destinationVC.exCount = self.exCount
            destinationVC.exKg = self.exKg
            destinationVC.exPassOrFail = self.exPassOrFail
        }
        
        
    }
    
    
}
