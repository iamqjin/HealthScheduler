//
//  AddExerciseTableViewController.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class AddExerciseTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //부위별 섹션수 
    //가슴, 등, 다리, 팔, 어깨, 코어, 기타
    var bodyPartNumber = 7
    
    //취소버튼시 모달 취소
    @IBAction func addExerciseCancel(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //섹션 헤더별 타이틀 지정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var headerTitle : String?
        
        switch section {
        case 0:
            headerTitle = "가슴"
        case 1:
            headerTitle = "등"
        case 2:
            headerTitle = "다리"
        case 3:
            headerTitle = "팔"
        case 4:
            headerTitle = "어깨"
        case 5:
            headerTitle = "코어"
        case 6:
            headerTitle = "기타"
        default:
            print("잘못된 접근")
        }
        
        return headerTitle!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    //부위에 따라 섹션 갯수 달라짐
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return bodyPartNumber
    }
    
    //섹션별 테이블 수 지정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        var rowNumber : Int?
        
        switch section {
        case 0:
            rowNumber = 1
        case 1:
            rowNumber = 1
        case 2:
            rowNumber = 1
        case 3:
            rowNumber = 1
        case 4:
            rowNumber = 1
        case 5:
            rowNumber = 1
        case 6:
            rowNumber = 1
        default:
            print("잘못된 접근")
        }
        
        return rowNumber!
        
    }

    //섹션 별 테이블 데이터 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseListCell", for: indexPath)

        // Configure the cell...
        //가슴, 등, 다리, 팔, 어깨, 코어, 기타
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "가슴"
        case 1:
            cell.textLabel?.text = "등"
        case 2:
            cell.textLabel?.text = "다리"
        case 3:
            cell.textLabel?.text = "팔"
        case 4:
            cell.textLabel?.text = "어깨"
        case 5:
            cell.textLabel?.text = "코어"
        case 6:
            cell.textLabel?.text = "기타"
        default:
            print("잘못된 접근")
        }

        return cell
    }
    
    //체크마크 설정
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    
    //체크마크 비설정
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
}
