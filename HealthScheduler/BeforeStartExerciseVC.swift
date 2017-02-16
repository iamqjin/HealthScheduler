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
    
    //선택된 테이블 상세내역
    var scheduleDetail : String!
    
    @IBOutlet weak var exerciseStartButton: UIButton!
    @IBOutlet weak var scheduleInfoLabel: UILabel!
    
    //스케줄 시작 취소
    @IBAction func scheduleStartCancelAction(_ sender: Any) {
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //디테일 입력
        scheduleInfoLabel.text = scheduleDetail
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startExSegue" {
            
            let startExVC = segue.destination as! StartExerciseVC
            startExVC.scheduleNum = self.scheduleNum
        }
    }
    

}
