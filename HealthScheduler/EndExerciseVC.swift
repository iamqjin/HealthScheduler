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
    
    //최종 히스토리
    var finalHistory = [ExSet]()
    
    
    
    @IBOutlet weak var endExTableView: UITableView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var selectImageButton: UIButton!
    
    //저장하기 버튼 액션
    @IBAction func saveAction(_ sender: Any) {
        
        
        print("저장하기 눌림")
        for i in finalHistory {
            print(i.setId!, i.weight! ,i.count!, i.passOrFail!)
        }
        
        saveHistory()
        
        
    }
    
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
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
//            self.selectImageButton.setImage(#imageLiteral(resourceName: "Add"), for: .normal)
        })
        
        let libraryButton = UIAlertAction(title: "앨범에서 선택", style: .default , handler: { (action) -> Void in
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            
            print("앨범에서 선택")
        })
        
        let imageDeleteButton = UIAlertAction(title: "이미지 삭제", style: .destructive , handler: { (action) -> Void in
            print("이미지 삭제")
            
            //다시 똑같은 이미지로 채워넣음
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
        //기록지 프린트
        for i in 0..<exLog.count {
            if i == (exLog.count - 1){
                prettyExLog += exLog[i]
            } else {
                prettyExLog += exLog[i] + "\n"
            }
        }
        
        print("전송된 마침 시간",endTime)
        
        //셀 크기 알아서 조절
        endExTableView.rowHeight = UITableViewAutomaticDimension
        endExTableView.estimatedRowHeight = 1000
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: ImagePickerView
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: false) { () in
            
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true) { () in
            
            if let img = info[UIImagePickerControllerOriginalImage] as? UIImage{
                self.selectImageButton.setImage(img, for: .normal)
            }
            
        }
    }
    
    
    
    //MARK: TableView
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
                cell.textLabel?.text = prettyExLog //운동 기록지
            }
        } else {
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = today
            case 1:
                cell.textLabel?.text = startTime
            case 2:
                cell.textLabel?.text = endTime
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
    
    

    //히스토리 저장하기
    func saveHistory() {
        
        //현재 버튼 이미지
//        selectImageButton.image(for: .normal)
        
        print("히스토리저장 함수 호출됨")
    }

}
