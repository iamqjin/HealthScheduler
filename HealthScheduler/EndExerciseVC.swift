//
//  EndExerciseVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 14..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class EndExerciseVC: UIViewController, UITableViewDelegate , UITableViewDataSource {

    //데이터 test
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var selectImageButton: UIButton!
    
    
    //삭제하기 버튼 액션
    @IBAction func deleteAction(_ sender: Any) {
        let alertController = UIAlertController(title: "히스토리 삭제", message: "저장된 기록이 사라질 수 있습니다", preferredStyle: .alert)
        
        //확인 버튼시 삭제 후 스케줄화면으로 돌아감(미완성)
        let deleteButton = UIAlertAction(title: "삭제하기", style: .destructive, handler: nil)
        
        //취소시 그냥 얼럿창만 제거
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    //사진 선택 버튼액션
    @IBAction func addPicAction(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "사진 찍기", style: .default, handler: { (action) -> Void in
            print("사진 찍기")
            self.selectImageButton.setImage(#imageLiteral(resourceName: "Add"), for: .normal)
        })
        
        let libraryButton = UIAlertAction(title: "앨범에서 선택", style: .default , handler: { (action) -> Void in
            print("앨범에서 선택")
        })
        
        let imageDeleteButton = UIAlertAction(title: "이미지 삭제", style: .destructive , handler: { (action) -> Void in
            print("이미지 삭제")
            self.selectImageButton.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: { (action) -> Void in
            print("취소 버튼 눌림")
        })
        
        //버튼 속 이미지가 기존 이미지와 같을때
        if sender.image(for: .normal) == #imageLiteral(resourceName: "camera") {
            alertController.addAction(cameraButton)
            alertController.addAction(libraryButton)
            alertController.addAction(cancelButton)
        } else {
            //기존 이미지와 다를때 == 새로운 이미지 선택됨
            alertController.addAction(cameraButton)
            alertController.addAction(libraryButton)
            alertController.addAction(imageDeleteButton)
            alertController.addAction(cancelButton)
        }
    
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //테이블 뷰 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //테이블 속 셀 데이터 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseSaveCell", for: indexPath)
    
        //섹션별 데이터 설정
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "스케줄 이름"
            } else {
                cell.textLabel?.text = "운동 마침 내역들"
            }
        } else {
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "17.02.15"
            case 1:
                cell.textLabel?.text = "시작 시간 PM 06:30"
            case 2:
                cell.textLabel?.text = "끝난 시간 PM 07:30"
            case 3:
                cell.textLabel?.text = "메모"
            default:
                print("아무것도안행")
            }
            
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return 4
        default:
            return 1
        }
    }
    
    //헤더 높이 지정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44
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
