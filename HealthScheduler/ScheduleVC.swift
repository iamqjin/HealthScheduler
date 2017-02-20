//
//  ScheduleVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class ScheduleVC : UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    //데이터 test
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
   
    //스케줄 테이블 객체
    @IBOutlet var scheduleTable: UITableView!

    
    @IBAction func SignUpAction(_ sender: Any) {
        print("로그인 버튼 눌림")
    }
    
    //히스토리 저장버튼 클릭시 삭제 후 스케줄화면으로 돌아감
    @IBAction func exerciseEndSaveSegue(_ sender: UIStoryboardSegue) {
        print("운동끝윈드")
    }
    
    @IBAction func scheduleSaveSegue(_ sender: UIStoryboardSegue) {
        print("스케줄 저장윈드")
    }
    
    @IBAction func exerciseEndNotSaveSegue(_ sender: UIStoryboardSegue) {
        print("운동 끝 저장 안한 세그")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //화면 사라졌을때 편집 모드이면 무조건 해제
        scheduleTable.setEditing(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        //탭바 N 뱃지 설정
        self.navigationController?.tabBarItem.badgeValue = String(appDelegate.scheduleList.count)
        
        //데이터 리로드
        self.scheduleTable.reloadData()
        
    }


    // MARK: - Table view data source
    
    //섹션 수
    func numberOfSections(in tableView: UITableView) -> Int { return 2 }
    
    //섹션 별 테이블 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //내가 짠 스케줄 | 트레이너가 짜준 스케줄 따로
        if section == 0 {
            return self.appDelegate.scheduleList.count
        } else {
            return 0
        }
    }

    
    //테이블 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        //직접 짠 스케줄 데이터 셀
        if indexPath.section == 0 {
            
            let cellForAny = tableView.dequeueReusableCell(withIdentifier: "scheduleCellForAny", for: indexPath) as! ScheduleListForAnyCell
            
            cellForAny.scheduleTitleLabel.text = self.appDelegate.scheduleList[indexPath.row].title
            cellForAny.exListLabel.text = self.appDelegate.scheduleList[indexPath.row].exSummary
            
            return cellForAny
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
            //데이터 test
            cell.textLabel?.text = "하이"
            return cell
        }

    }
 
    //테이블 헤더 높이 설정
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        let headerHeight : CGFloat = 40
//        
//        return headerHeight
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UIView()
//        header.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40)
//        let sectionLabel = UILabel()
//        sectionLabel.frame = CGRect(x: 16, y: 0, width: tableView.frame.size.width - 16, height: 38)
//        sectionLabel.numberOfLines = 1
//        sectionLabel.textColor = UIColor.black
//        sectionLabel.font = UIFont(name: "NanumBarunGothicOTF", size: 14)
//        header.backgroundColor = UIColor.darkGray
//        
//        if section == 0 {
//            sectionLabel.text = "맘대로 짜는 스케줄"
//        } else {
//            sectionLabel.text = "트레이너가 짜면 다른 스케줄"
//        }
//        header.addSubview(sectionLabel)
//        return header
//    }
    
    
    
    //테이블 헤더 타이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let headerTitle : String?
        
        if section == 0 {
            headerTitle = "맘대로 짜는 스케줄"
        } else {
            headerTitle = "트레이너가 짜면 다른 스케줄"
        }
        
        return headerTitle
    }

    //테이블 편집 모드 가능
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    //테이블 삭제 부분
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            appDelegate.scheduleList.remove(at: indexPath.row)
            
        } else {
            print("여긴 트레이너 스케줄 삭제부분")
        }
        
        //edit이후 데이터 리로드
        scheduleTable.reloadData()
        
    }
    
    //테이블 선택시 작동 부분
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //선택된 인덱스
        let selectedIndexPath = indexPath
        
        performSegue(withIdentifier: "beforeStartExSegue", sender: selectedIndexPath)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "beforeStartExSegue" {
            
            var indexPath = sender as! IndexPath
            let navVC = segue.destination as! UINavigationController
            let beforeStartExVC = navVC.topViewController as! BeforeStartExerciseVC
            beforeStartExVC.scheduleNum = indexPath
            beforeStartExVC.scheduleDetail = self.appDelegate.scheduleList[indexPath.row].exSummary
        }
    }
    
    
}
