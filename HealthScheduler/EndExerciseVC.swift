//
//  EndExerciseVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 14..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class EndExerciseVC: UIViewController, UITableViewDelegate , UITableViewDataSource , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    //데이터 test
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    //운동 기록지
    var exLog = [String]()
    //이쁘게 변형될 기록지
    var prettyExLog = String()
    var today = String()
    var startTime = String()
    var endTime = String()
    var totalTimeMinOrSec = String()
    
    var scheduleTitle = String()
    
    
    //test
    var setNumList = [Int]()
    var exCount = [Int]()
    var exKg = [Int]()
    var exPassOrFail = [String]()
    
    var totalWeight = Int()
    var okChecker = Int()
    var percent = Int()
    
    
    //최종 히스토리
    var finalHistory = [ExSet]()
    
    @IBOutlet weak var addProgressImageView: UIImageView!
    @IBOutlet weak var endExTableView: UITableView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var selectImageButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let uiBarButtonItem = sender as? UIBarButtonItem else { return }
        
        if saveButton == uiBarButtonItem {
            print("저장하기 눌림")
            saveHistory()
        } else if deleteButton == uiBarButtonItem {
            
        }
    }
    
    //삭제하기 버튼 액션
    @IBAction func deleteAction(_ sender: Any) {
        let alertController = UIAlertController(title: "히스토리 삭제", message: "저장된 기록이 사라질 수 있습니다", preferredStyle: .alert)
        
        //확인 버튼시 삭제 후 스케줄화면으로 돌아감
        let deleteButton = UIAlertAction(title: "삭제하기", style: .destructive, handler: {
            (_) in
            self.performSegue(withIdentifier: "exerciseEndNotSaveSegue", sender: self)
        })
        
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
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        let libraryButton = UIAlertAction(title: "앨범에서 선택", style: .default , handler: { (action) -> Void in
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
            
        })
        
        let imageDeleteButton = UIAlertAction(title: "이미지 삭제", style: .destructive , handler: { (action) -> Void in
            
            //이미지 비우고 타이틀 재설정
            self.addProgressImageView.image = nil
            self.selectImageButton.setTitle("Add Progress Photo >>", for: .normal)

        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: { (action) -> Void in
            print("취소 버튼 눌림")
        })
        
        //버튼 속 이미지 비어있을 때
        if self.addProgressImageView.image == nil {
            alertController.addAction(cameraButton)
            alertController.addAction(libraryButton)
            alertController.addAction(cancelButton)
        } else {
            //새로운 이미지 선택됨
            alertController.addAction(cameraButton)
            alertController.addAction(libraryButton)
            alertController.addAction(imageDeleteButton)
            alertController.addAction(cancelButton)
        }
    
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        print("세트수 리스트",setNumList)
        
        //test
        
        
        //기록지 프린트
        for i in 0..<exLog.count {
            if i == (exLog.count - 1){
                prettyExLog += exLog[i]
            } else {
                prettyExLog += exLog[i] + "\n"
            }
            
            totalWeight += (exKg[i] * exCount[i])
            if exPassOrFail[i] == "성공" {
                okChecker += 1
            }
         }
        
        percent = Int((okChecker * 100 ) / exLog.count)
        
        print("전송된 마침 시간",endTime)
        
        //셀 크기 알아서 조절
        endExTableView.rowHeight = UITableViewAutomaticDimension
        endExTableView.estimatedRowHeight = 1000
        
    }
    
    //MARK: ImagePickerView
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true) { () in
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true) { () in
            
            if let img = info[UIImagePickerControllerEditedImage] as? UIImage{
                
                //이미지 삽입, 버튼 타이틀 재설정
                self.addProgressImageView.image = img
                self.selectImageButton.setTitle("", for: .normal)
            }
            
        }
    }
    
    
    
    //MARK: TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //테이블 속 셀 데이터 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellBold = tableView.dequeueReusableCell(withIdentifier: "ExerciseSaveBoldCell", for: indexPath)
        let cellLight = tableView.dequeueReusableCell(withIdentifier: "ExerciseSaveLightCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseSaveCell", for: indexPath)
        let totalCell = tableView.dequeueReusableCell(withIdentifier: "TotalCell", for: indexPath) as! TotalCell
    
        //섹션별 데이터 설정
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cellBold.textLabel?.text = scheduleTitle //스케줄 타이틀
                return cellBold
            } else if indexPath.row == 1{
                cell.textLabel?.text = prettyExLog //운동 기록지
                return cell
            } else {
                totalCell.totalWeightLabel.text = String(totalWeight) + "kg"
                totalCell.percentLabel.text = String(percent) + "%"
                return totalCell
            }
        } else {
            switch indexPath.row {
            case 0:
                cellLight.textLabel?.text = today
                return cellLight
            case 1:
                cellLight.textLabel?.text = startTime + " - " + endTime + " (\(totalTimeMinOrSec))"
                return cellLight
            default:
                print("아무것도안행")
                return cellLight
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        default:
            return 1
        }
    }
    
    //헤더 높이 지정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44
    }
    
    
    //MARK: Save Func

    //히스토리 저장하기
    func saveHistory() {
        //appdelegate 속 historyList에 저장
        if self.addProgressImageView.image == nil {
           //이미지 선택 안한 저장시
            print("이미지 선택안한 세이브 호출")
            print(self.prettyExLog)
            appDelegate.historyList.append(History(scheduleTitle: self.scheduleTitle, startTime: self.startTime, endTime: self.endTime, date: self.today, progressTable: self.prettyExLog, totalTimeMinOrSec : self.totalTimeMinOrSec,totalWeight: self.totalWeight,percent : String(self.percent) + "%" ))
        } else {
            //이미지 선택 저장했을시
            print("이미지 선택한 세이브 호출")
            print(self.prettyExLog)
            appDelegate.historyList.append(History(scheduleTitle: self.scheduleTitle, progressImage: self.addProgressImageView.image! , startTime: self.startTime, endTime: self.endTime, date: self.today, progressTable: self.prettyExLog, totalTimeMinOrSec: self.totalTimeMinOrSec, totalWeight :self.totalWeight,percent : String(self.percent) + "%" ))

        }
        
    }

}
