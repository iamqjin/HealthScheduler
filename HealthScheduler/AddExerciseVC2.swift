//
//  AddExerciseVC2.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 9..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class AddExerciseVC2: UIViewController, UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate ,zeroExceptionDelegate {

    //데이터 test
    var schedule : Schedule?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var saveOk = false
    var exSummary = ""
    
    @IBOutlet weak var textCount: UILabel!
    
    //넘겨온 운동 리스트
    var selectedExList : [Exercise]!
    
    @IBAction func addEx02SaveAction(_ sender: Any) {
        if makeExSummary() == true && makeExsetList() == true{
            //스케줄 저장
            saveSchedule()
            
//            for i in 0..<selectedExList.count {
//                print("\(i)번째",schedule?.exerciseList[i].exSetList)
//            }

        } else {
            print("무슨일 있는겨")
        }
    }
    
    @IBOutlet weak var addEx02Button: UIBarButtonItem!
    
    //운동추가 2번 화면 테이블 객체
    @IBOutlet weak var addEx02TableView: UITableView!
    
    //스케줄 이름 입력 텍스트 필드
    @IBOutlet weak var scheduleTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.scheduleTitleTextField.delegate = self
        scheduleTitleTextField.becomeFirstResponder()
        
        addEx02Button.isEnabled = saveOk //비활성화
        scheduleTitleTextField.placeholder = "스케줄 타이틀을 작성해주세요"
    }
    
    
    //MARK : 텍스트 필드
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        textField.endEditing(true)
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Figure out what the new text will be, if we return true
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        self.textCount.text = String(newText.length)
        if newText.length != 0 {
            //제목을 입력했으면 저장가능
            saveOk = true
            //버튼 활성화
            addEx02Button.isEnabled = saveOk
        } else {
            saveOk = false
            //버튼 비활성화
            addEx02Button.isEnabled = saveOk

        }
        
        return true;
    }
    
    //--------------------------------------------------
    
    
    
    //섹션별 row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.selectedExList.count
    }
    
    //셀 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddEx02Cell", for: indexPath) as! AddEx02Cell
        
        //선택된 운동리스트들
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
    
    
    //델리게이트 처리
    //세트 수 0으로 내려갔을 시 익셉션 처리
    func zeroAlertAction() {
        print("호출")
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        let alert = UIAlertController(title: "", message: "세트 수는 0회 이하로 설정할 수 없습니다.", preferredStyle: .alert)
        
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //세트수 저장
    func checkSetCount(setCount: Int, tagNum: Int) {
        
        selectedExList[tagNum].exSetCount = setCount
        
    }
    
    //스케줄 저장 
    func saveSchedule() {
        //델리게이트 안에 있는 스케줄의 수로 id값을 생성
        schedule = Schedule(scheduleId : appDelegate.scheduleList.count ,exSummary : exSummary , title: scheduleTitleTextField.text, exerciseList: selectedExList)
        appDelegate.scheduleList.append(self.schedule!)
    }
    
    //요약본 만들기
    func makeExSummary() -> Bool {
        
        //실행자
        var excuted = false
        
        for i in 0..<selectedExList.count {
            if i == 0 {
                exSummary += (selectedExList[i].name! + " x " + String(describing: selectedExList[i].exSetCount!))
            } else {
                exSummary += (", " + selectedExList[i].name! + " x " + String(describing: selectedExList[i].exSetCount!))
            }
        }
        
        //요약이 빈통이 아닐때 작동했다는 불값전송
        if exSummary != "" {
            excuted = true
        } else {
            print("요약 실행 ㄴㄴ")
        }
        
        
        return excuted
    }
    
    //운동들 각각 세트리스트 생성 함수
    func makeExsetList() -> Bool {
        
        //실행자
        var excuted = false
        
        //i번 받아온 운동리스트를 받고
        for i in selectedExList {
            //각각의 운동에 있는 세트 수만큼 exSet을 대입시켜준다.
//            for j in 0..<i.exSetCount! {
//                //세트별 id 값 생성
//                let exSet = ExSet(setId: j)
//                i.exSetList.append(exSet)
//            }
            i.makeSetList(setCount: i.exSetCount!)
            
        }
        
        excuted = true
        
        return excuted
    }
    
}
