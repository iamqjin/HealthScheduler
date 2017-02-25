//
//  HistoryVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 15..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class HistoryVC: UITableViewController {
    
    //History생성
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //총무게
    var totalWeight = Int()
    
    @IBOutlet var historyTableView: UITableView!
//    @IBOutlet weak var profileImageView: UIImageView!
//    @IBOutlet weak var profileNameLabel: UILabel!
//    @IBOutlet weak var profileKgLabel: UILabel!
//    @IBOutlet weak var profileKmLabel: UILabel!
//    @IBOutlet weak var profileHistoryCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //프로필 test
//        profileNameLabel.text = "사규진"
//        profileKmLabel.text = "0"
//        profileHistoryCount.text = String(appDelegate.historyList.count)
        
                
        //셀 크기 알아서 조절
        historyTableView.rowHeight = UITableViewAutomaticDimension
        historyTableView.estimatedRowHeight = 1000
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        for i in appDelegate.historyList{
            totalWeight += i.totalWeight!
        }
        
//        profileKgLabel.text = "\(self.totalWeight)"
//        profileHistoryCount.text = String(appDelegate.historyList.count)
        
        //히스토리 테이블 리프레시
        historyTableView.reloadData()
        historyTableView.scrollToRow(at: IndexPath(row:0,section:0), at: UITableViewScrollPosition.init(rawValue: 0)!, animated: false)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        totalWeight = 0
    }
    
    // MARK: - Table
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let historyList = appDelegate.historyList
        let cellForIndex = indexPath.row - 1
        
        //이미지가 있는 테이블과 이미지가 없는 테이블을 나누어야함
        if appDelegate.historyList.count == 0 {
            
            if indexPath.row == 0 {
                let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
                profileCell.historyCount.text = String(historyList.count)
                profileCell.totalWeight.text = String(self.totalWeight)
                return profileCell
            } else {
                let emptyCell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell") as! EmptyCell
                return emptyCell
            }
            
            
        } else {
            if indexPath.row == 0 {
                let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
                profileCell.historyCount.text = String(historyList.count)
                profileCell.totalWeight.text = String(self.totalWeight)
                return profileCell
            } else {
                if appDelegate.historyList[cellForIndex].progressImage == nil {
                    let nonImageCell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryCell
                    nonImageCell.scheduleTitle.text = historyList[cellForIndex].scheduleTitle
                    nonImageCell.scheduleDate.text = historyList[cellForIndex].totalTime! + "(\(historyList[cellForIndex].totalTimeMinOrSec!))"
                    nonImageCell.exLog.text = historyList[cellForIndex].preogressTable
                    nonImageCell.totalWeightLabel.text = String(describing: historyList[cellForIndex].totalWeight!) + "kg"
                    nonImageCell.percentLabel.text = historyList[cellForIndex].percent
                    return nonImageCell
                    
                } else {
                    let imageCell = tableView.dequeueReusableCell(withIdentifier: "HistoryImageCell") as! HistoryImageCell
                    imageCell.scheduleTitle.text = historyList[cellForIndex].scheduleTitle
                    imageCell.scheduleDate.text = historyList[cellForIndex].totalTime! + "(\(historyList[cellForIndex].totalTimeMinOrSec!))"
                    imageCell.historyImageView.image = historyList[cellForIndex].progressImage
                    imageCell.exLog.text = historyList[cellForIndex].preogressTable
                    imageCell.totalWeightLabel.text = String(describing: historyList[cellForIndex].totalWeight!) + "kg"
                    imageCell.percentLabel.text = historyList[cellForIndex].percent
                    
                    return imageCell
                }
            }
            
        }
        
        
    
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if appDelegate.historyList.count == 0 {
            return 2
        } else {
            return appDelegate.historyList.count + 1
        }
    }

}
