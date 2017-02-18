//
//  HistoryVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 15..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class HistoryVC: UITableViewController {
    
    
//    var historyList : [History]!
    
    //History생성
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet var historyTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //셀 크기 알아서 조절
        historyTableView.rowHeight = UITableViewAutomaticDimension
        historyTableView.estimatedRowHeight = 1000

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //히스토리 테이블 리프레시
        historyTableView.reloadData()
        
    }
    
    // MARK: - Table
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        return appDelegate.historyList[section].date
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        
//        return 44.0
//        
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //이미지가 있는 테이블과 이미지가 없는 테이블을 나누어야함(미완성)
        
        if appDelegate.historyList[indexPath.row].progressImage == #imageLiteral(resourceName: "camera") {
            let nonImageCell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
            nonImageCell.scheduleTitle.text = appDelegate.historyList[indexPath.row].scheduleTitle
            nonImageCell.scheduleDate.text = appDelegate.historyList[indexPath.row].totalTime
            nonImageCell.exLog.text = appDelegate.historyList[indexPath.row].preogressTable
            return nonImageCell
            
        } else {
             let imageCell = tableView.dequeueReusableCell(withIdentifier: "HistoryImageCell") as! HistoryImageCell
            imageCell.scheduleTitle.text = appDelegate.historyList[indexPath.row].scheduleTitle
            imageCell.scheduleDate.text = appDelegate.historyList[indexPath.row].totalTime
            imageCell.historyImageView.image = appDelegate.historyList[indexPath.row].progressImage
            imageCell.exLog.text = appDelegate.historyList[indexPath.row].preogressTable
            
            return imageCell
        }
    
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return appDelegate.historyList.count
    
    }

}
