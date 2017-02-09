//
//  AddExerciseVC1.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

enum KindOfExercise {
    
    case chest
    case back
    case leg
    case arms
    case shoulder
    case core
    case etc
}

class AddExerciseVC1: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //부위별 섹션수 
    //가슴, 등, 다리, 팔, 어깨, 코어, 기타
    var bodyPartNumber = 7
    
//    var chest = ["벤치프레스","인클라인 벤치프레스","디클라인 벤치프레스","케이블 크로스오버","푸쉬업","덤벨 플라이","덤벨 풀오버","덤벨 프레스","딥스"]
    var chestList = ["벤치 프레스 - 머신","벤치 프레스 - 바벨, 플랫","벤치 프레스 - 덤벨, 플랫","벤치 프레스 - 바벨, 인클라인","벤치 프레스 - 덤벨, 인클라인","플라이 - 덤벨, 인클라인","벤치 프레스 - 바벨, 디클라인","벤치 프레스 - 덤벨, 디클라인","플라이 - 덤벨, 플랫","풀오버 - 덤벨, 플랫","플라이 - 펙 덱 머신","딥스","푸시업","니 푸시업","크로스 오버 - 케이블","푸시업 사이드 점프"]
    
    //선택된 운동 리스트
    var selectedEx = [String]()
    
    @IBOutlet weak var addExerciseButton: UIButton!
    
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
        
        //버튼 활성화 설정
        addExerciseButton.isEnabled = false
        addExerciseButton.setTitle("운동을 선택해주세요", for: .disabled)
        print("배열카운트" , selectedEx.count)
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
            rowNumber = chestList.count
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
        
        let section = indexPath.section
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseListCell_1", for: indexPath)

        
        // Configure the cell...
        //가슴, 등, 다리, 팔, 어깨, 코어, 기타
        
        
        switch section {
        case 0:
            cell.textLabel?.text = chestList[row]
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
            
            print("선택된 셀 텍스트",(cell.textLabel?.text)!,"넘버",(indexPath))
            selectedEx.append((cell.textLabel?.text)!)

        }
        
        //버튼 활성화
        if selectedEx.count != 0 {
            
            addExerciseButton.isEnabled = true
            addExerciseButton.setTitle("선택된 운동 (\(selectedEx.count))", for: .normal)
            
        }
    }
    
    //체크마크 비설정
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
            
            print("선택해제된 셀 텍스트",(cell.textLabel?.text)!, "넘버", (indexPath))
            
            selectedEx.remove(at: selectedEx.index(of: (cell.textLabel?.text)!)!)
//            selectedEx.append((cell.textLabel?.text)!)
            
        }
        
        //버튼 비활성화
        if selectedEx.count == 0 {
            
            addExerciseButton.isEnabled = false
            addExerciseButton.setTitle("운동을 선택해주세요", for: .disabled)
        }
        
        for all in selectedEx {

            print("총들어잇는애들",all)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("----------",sender!)
        
        let destinationVC = segue.destination as! AddExerciseVC2
        
        print("보내기전 리스트",selectedEx)
        destinationVC.selectedExList = selectedEx
        
    }
    
}
