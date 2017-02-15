//
//  HistoryVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 15..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class HistoryVC: UITableViewController {

    var someArray = [1,2,3]
    
    var historyList : [History]!
    
    //History생성
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet var historyTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //앱 델리게이트에 있는 히스토리 리스트를 입력
        self.historyList = appDelegate.historyList
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //히스토리 테이블 리프레시
        historyTableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        //히스토리 배열 카운트를 넣어야함
        return self.historyList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //이미지가 있는 테이블과 이미지가 없는 테이블을 나누어야함(미완성)
        switch indexPath.row {
        case 0:
            //타이틀과 요일 시간표시 셀
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTitleCell", for: indexPath)
            cell.textLabel?.text = "스케줄이름"
            cell.detailTextLabel?.text = "오전 11:48 ~ 오후 13:48 (120분)"
            
            return cell
            
        case 1:
            //이미지 셀
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryImageCell", for: indexPath) as! HistoryImageCell
            
            cell.historyImageView.image = #imageLiteral(resourceName: "Add")
            
            return cell
            
        case 2:
            //운동 기록지
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
            
            cell.textLabel?.text = "운동기록 리스트 삽입부"
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
            
            return cell
        }
    
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    
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
