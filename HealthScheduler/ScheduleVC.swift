//
//  ScheduleVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class ScheduleVC : UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileNameLabel: UILabel!
    
    @IBOutlet weak var profileDetailLabel: UILabel!
    
    @IBAction func SignUpAction(_ sender: Any) {
        print("회원가입 버튼 눌림")
    }
    
    
    //데이터 test
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var schedule : [Schedule]!
    
    //스케줄 테이블 객체
    @IBOutlet var scheduleTable: UITableView!
    //에디트 모드 버튼
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    @IBAction func editAbleAction(_ sender: Any) {
        if scheduleTable.isEditing {
            self.editButton.title = "편집"
            //edit 모드에서 눌렸을때 취소로
            scheduleTable.setEditing(false, animated: false)
        } else {
            self.editButton.title = "완료"
            //edit모드로
            scheduleTable.setEditing(true, animated: false)
        }
        //edit이후 데이터 리로드
        scheduleTable.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        profileImageView.image = UIImage(named: "Add")
        profileNameLabel.text = "사규진"
        profileDetailLabel.text = "아마 곧 돼지"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //데이터 test
        self.schedule = appDelegate.scheduleList
        
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
            numberOfRows = schedule.count
        case 1:
            numberOfRows = schedule.count
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
            cell.textLabel?.text = self.schedule[indexPath.row].title
            cell.detailTextLabel?.text = self.schedule[indexPath.row].exSummary!
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

    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
}
