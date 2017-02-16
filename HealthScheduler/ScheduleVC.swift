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
//    var schedule : [Schedule]!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileNameLabel: UILabel!
    
    @IBOutlet weak var profileDetailLabel: UILabel!
    
    @IBAction func SignUpAction(_ sender: Any) {
        print("회원가입 버튼 눌림")
    }
    
    //스케줄 테이블 객체
    @IBOutlet var scheduleTable: UITableView!
    //에디트 모드 버튼
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    //히스토리 저장버튼 클릭시 삭제 후 스케줄화면으로 돌아감
    @IBAction func exerciseEndSaveSegue(_ sender: UIStoryboardSegue) {
        
        print("여긴 운동끝 세그리턴",sender)
    }
    
    @IBAction func saveAndReturnWind(_ sender: UIStoryboardSegue) {
        
        print("돌아옴")
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editAbleAction(_ sender: Any) {
        if scheduleTable.isEditing {
            self.editButton.title = "편집"
            //edit 모드에서 눌렸을때 취소로
            scheduleTable.setEditing(false, animated: true)
        } else {
            self.editButton.title = "완료"
            //edit모드로
            scheduleTable.setEditing(true, animated: true)
        }
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //화면 사라졌을때 편집 모드이면 무조건 해제
        scheduleTable.setEditing(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //프로필 test
        profileImageView.image = UIImage(named: "Add")
        profileNameLabel.text = "사규진"
        profileDetailLabel.text = "아마 곧 돼지"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //데이터 test
//        self.schedule = appDelegate.scheduleList
        
        //탭바 N 뱃지 설정
        self.navigationController?.tabBarItem.badgeValue = "N"
        
        self.scheduleTable.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: - Table view data source
    
    //섹션 수
    func numberOfSections(in tableView: UITableView) -> Int {

        return 2
        
    }
    
    //섹션 별 테이블 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRows : Int?
        
        //내가 짠 스케줄 | 트레이너가 짜준 스케줄 따로
        switch section {
        case 0:
//            numberOfRows = schedule.count
            numberOfRows = self.appDelegate.scheduleList.count
        case 1:
            numberOfRows = 0
        default:
            numberOfRows = 1
        }
        
        return numberOfRows!
    }

    
    //테이블 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
        
        
        //직접 짠 스케줄 데이터 셀
        switch indexPath.section {
            
        case 0:
            //데이터 test
//            cell.textLabel?.text = self.schedule[indexPath.row].title
//            cell.detailTextLabel?.text = self.schedule[indexPath.row].exSummary!
            cell.textLabel?.text = self.appDelegate.scheduleList[indexPath.row].title
            cell.detailTextLabel?.text = self.appDelegate.scheduleList[indexPath.row].exSummary

        case 1:
            //데이터 test
            cell.textLabel?.text = "하이"
            
        default:
            print("잘못된 접근입니다")
        }

        return cell
    }
 
    //테이블 헤더 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerHeight : CGFloat = 63.0
        
        return headerHeight
    }
    
    //테이블 헤더 타이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let headerTitle : String?
        
        switch section {
        case 0:
            headerTitle = "맘대로 짜는 스케줄"
        case 1:
            headerTitle = "트레이너가 짜면 다른 스케줄"
        default:
            headerTitle = "잘못된 접근 스케줄"
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
            let beforeStartExVC = segue.destination as! BeforeStartExerciseVC
            beforeStartExVC.scheduleNum = indexPath
            beforeStartExVC.scheduleDetail = self.appDelegate.scheduleList[indexPath.row].exSummary
        }
    }
    
    
}
