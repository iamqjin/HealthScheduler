
//
//  HP03_ViewController.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 7..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class HP03_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderTableViewCellDelegate {

    var indexRow : IndexPath? //이전 테이블뷰에서 선택된 테이블
    
    //데이터 테스트
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var cells = [Int]()
    var exCount = 0
    
    //테이블 뷰 아울렛 변수
    @IBOutlet weak var routineTable: UITableView!
    
    @IBAction func addExercise(_ sender: Any) {
        exCount += 1
        routineTable.reloadData()
    }

    //HeaderTableViewCellDelegate 메소드
    func addSet() {
        cells = self.cells + [1]
//        appDelegate.exModel.append(makedDummyEx!)
        routineTable.reloadData()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.dummy = appDelegate.exModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //네비게이션 툴바에 아이템 추가
         navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
        
        //직접 스케줄 지정
        if indexRow!.section == 0 {
            print("여긴 직접 스케줄 뷰")
            
        } else if indexRow!.section == 1 {
            //등, 다리, 가슴, 팔
            if indexRow!.row == 0 {
                print("등")
            } else if indexRow!.row == 1 {
                print("다리")
            } else if indexRow!.row == 2 {
                print("가슴")
            } else if indexRow!.row == 3 {
                print("팔")
            }
        }

    }
    
    //edit버튼 눌렸을때 작동
    func editAction() {
        print("editAction")
    }
    
    //섹션 갯수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return exCount
    }
    
    //섹션 헤더 뷰 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderTableViewCell
        header.headerLabel.text = "테스트"
        header.delegate = self
        return header
    }
    
//    //섹션 푸터 뷰 설정
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footer = tableView.dequeueReusableCell(withIdentifier: "footer") as! FooterTableViewCell
//        
//        return footer
//    }
    
    //섹션 속 테이블 수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    //섹션 헤더 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let height : CGFloat = 63.0
        
        return height
    }
    
    //섹션 푸터 높이 설정
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        let height : CGFloat = 60.0
        
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("ㅁㅁㅁㅁㅁㅁ" ,indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "routineCell", for: indexPath)
            cell.textLabel?.text = "세트수 | 이전 무게 | 현재 무게 | 횟수 | 성공여부 "

        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
