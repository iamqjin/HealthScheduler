//
//  BeforeStartExerciseVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 16..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class BeforeStartExerciseVC: UIViewController {

    //선택된 테이블 indexPath받아옴
    var scheduleNum : IndexPath!
    
    //이쁜 운동 상세
    var prettyExDetail = String()
    
    //선택된 테이블 상세내역
    var scheduleDetail : String!
    
    @IBOutlet weak var exerciseStartButton: UIButton!
    @IBOutlet weak var scheduleInfoLabel: UILabel!
    
    @IBAction func startExerciseStartAction(_ sender: Any) {
        
        if scheduleNum.section == 0 {
            performSegue(withIdentifier: "startExSegue", sender: self)
        } else {
            performSegue(withIdentifier: "trainerStartSegue", sender: self)
        }
        
        
    }
    //스케줄 시작 취소
    @IBAction func startExerciseCancelAction(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //버튼 둥글게
        exerciseStartButton.layer.cornerRadius = 3.0
        exerciseStartButton.layer.borderWidth = 1
        exerciseStartButton.layer.borderColor = UIColor.clear.cgColor
        
        //디테일 입력
        let fullExDetail = scheduleDetail.components(separatedBy: ", ")
        
        for ex in fullExDetail {
            prettyExDetail += (ex + "\n")
        }
        
        print(prettyExDetail)
        scheduleInfoLabel.text = prettyExDetail
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startExSegue" {
            
            let startExVC = segue.destination as! StartExerciseVC
            startExVC.scheduleNum = self.scheduleNum
            
            //트레이너 test
        } else if segue.identifier == "trainerStartSegue" {
            
            let trainerStarExVC = segue.destination as! T_StartExerciseVC
            trainerStarExVC.scheduleNum = self.scheduleNum
            
        }
    }
    

}
