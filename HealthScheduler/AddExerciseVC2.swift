//
//  AddExerciseVC2.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 9..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class AddExerciseVC2: UIViewController, UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate ,zeroExceptionDelegate {

    //넘겨온 운동 리스트
    var selectedExList : [Exercise]!

    @IBOutlet weak var addEx02Button: UIButton!
    
    //운동추가 2번 화면 테이블 객체
    @IBOutlet weak var addEx02TableView: UITableView!
    
    //스케줄 이름 입력 텍스트 필드
    @IBOutlet weak var scheduleTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleTitleTextField.placeholder = "스케줄 타이틀을 작성해주세요"
    }
    
    //텍스트 필드 선언부 -------------------------
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        scheduleTitleTextField.becomeFirstResponder()
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    
    
    //--------------------------------------------------
    
    
    //세트 수 0으로 내려갔을 시 익셉션 처리
//    func zeroAlertAction() {
//        print("호출")
//    }
    func zeroAlertAction() {
        print("호출")
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        let alert = UIAlertController(title: "", message: "세트 수는 0회 이하로 설정할 수 없습니다.", preferredStyle: .alert)
        
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //섹션별 row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.selectedExList.count
    }
    
    //셀 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddEx02Cell", for: indexPath) as! AddEx02Cell
        
        let seletedEx = selectedExList[indexPath.row]
        
        //운동 순서와 운동 이름 입력
        cell.selectedExLabel.text = String(describing: seletedEx.id!) + "." +  seletedEx.name!
        //버튼들에 row를 태그로 입력
        cell.addEx02Button.tag = indexPath.row
        cell.minusEx02Button.tag = indexPath.row
        //각각 tagNum으로 row를 입력
        cell.tagNum = indexPath.row
        
        //zeroExceptionDelegate 설정
        cell.delegate = self
        return cell
    
    }
    
}
