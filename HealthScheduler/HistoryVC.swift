//
//  HistoryVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 15..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit
import FirebaseAuth

class HistoryVC: UITableViewController {
    
    //History생성
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var historyTableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileKgLabel: UILabel!
    @IBOutlet weak var profileKmLabel: UILabel!
    @IBOutlet weak var profileHistoryCount: UILabel!
    
    @IBAction func logOut(_ sender: Any) {
        
        //Firebase test
//        let test = DataController.sharedInstance().testFirebase()
        
        
        if FIRAuth.auth()?.currentUser != nil {
            try! FIRAuth.auth()!.signOut()
        } else {
            // No user is signed in.
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //프로필 test
//        profileImageView.image = UIImage(named: "Add")
        profileNameLabel.text = "사규진"
        profileKgLabel.text = "10000"
        profileKmLabel.text = "10000"
        profileHistoryCount.text = "10000"
        
                
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //이미지가 있는 테이블과 이미지가 없는 테이블을 나누어야함
        if appDelegate.historyList.count == 0 {
            let emptyCell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyCell
            return emptyCell
        } else {
            if appDelegate.historyList[indexPath.row].progressImage == nil {
                let nonImageCell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
                nonImageCell.scheduleTitle.text = appDelegate.historyList[indexPath.row].scheduleTitle
                nonImageCell.scheduleDate.text = appDelegate.historyList[indexPath.row].totalTime! + "(\(appDelegate.historyList[indexPath.row].totalTimeMinOrSec!))"
                nonImageCell.exLog.text = appDelegate.historyList[indexPath.row].preogressTable
                return nonImageCell
                
            } else {
                let imageCell = tableView.dequeueReusableCell(withIdentifier: "HistoryImageCell") as! HistoryImageCell
                imageCell.scheduleTitle.text = appDelegate.historyList[indexPath.row].scheduleTitle
                imageCell.scheduleDate.text = appDelegate.historyList[indexPath.row].totalTime! + "(\(appDelegate.historyList[indexPath.row].totalTimeMinOrSec!))"
                imageCell.historyImageView.image = appDelegate.historyList[indexPath.row].progressImage
                imageCell.exLog.text = appDelegate.historyList[indexPath.row].preogressTable
                
                return imageCell
            }
        }
        
        
    
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if appDelegate.historyList.count == 0 {
            return 1
        } else {
            return appDelegate.historyList.count
        }
    }

}
