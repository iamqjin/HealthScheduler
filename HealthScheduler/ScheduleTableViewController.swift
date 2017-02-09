//
//  ScheduleTableViewController.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    
    //데이터 테스트
    var mySchedule = [ScheduleModel]()
    var trainerSchedule = [ScheduleModel]()
    
    
    //내가 짠 스케줄 더미
    var dummy = [("슈퍼짱스케줄1", "오후 3:00", "오후 4:00", "2017-03-28",[("벤치프레스",[(1, 15, 10, true)]),("인클라인벤치프레스",[(1, 15, 10, true),(2,20,10, false)])]),("슈퍼짱스케줄2", "오후 3:00", "오후 4:00", "2017-03-28",[("벤치프레스",[(1, 15, 10, true)]),("인클라인벤치프레스",[(1, 15, 10, true),(2,20,10, false)])])]
    
    //트레이너가 짠 스케줄 더미
    var dummyTrainer = [("트레이너가짜면다르다스케줄1", "오후 3:00", "오후 4:00", "2017-03-28",[("벤치프레스",[(1, 15, 10, true)]),("인클라인벤치프레스",[(1, 15, 10, true),(2,20,10, false)])])]
    
    
    @IBOutlet var scheduleTable: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBAction func scheduleEditAble(_ sender: Any) {
 
        if scheduleTable.isEditing {
            self.editButton.title = "편집"
            //edit 모드에서 눌렸을때 취소로
            scheduleTable.setEditing(false, animated: true)
        } else {
            self.editButton.title = "완료"
            //edit모드로
            scheduleTable.setEditing(true, animated: true)
        }
        //edit이후 데이터 리로드
        scheduleTable.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //탭바 N 뱃지 설정
        self.navigationController?.tabBarItem.badgeValue = "N"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    // MARK: - Table view data source
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        var numberOfRows : Int?
        
        //내가 짠 스케줄 | 트레이너가 짜준 스케줄 따로
        switch section {
        case 0:
            numberOfRows = dummy.count
        case 1:
            numberOfRows = dummyTrainer.count
        default:
            numberOfRows = 1
        }
        
        return numberOfRows!
    }

    
    //테이블 셀 설정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)

        //직접 짠 스케줄 데이터 셀
        switch indexPath.section {
        case 0:
            
            cell.textLabel?.text = self.dummy[indexPath.row].0

        case 1:
            
            cell.textLabel?.text = self.dummyTrainer[indexPath.row].0
            
        default:
            print("잘못된 접근입니다")
        }
        

        return cell
    }
 
    //테이블 헤더 높이 설정
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerHeight : CGFloat = 63.0
        
        return headerHeight
    }
    
    //테이블 헤더 타이틀 설정
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
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

    
    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
    

    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
 

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
