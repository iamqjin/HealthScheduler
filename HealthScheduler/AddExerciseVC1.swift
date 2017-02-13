//
//  AddExerciseVC1.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit


//운동 섹션 구조
struct ExSection {
    var sectionTitle: String!
    var exercises: [Exercise]!
    var collapsed: Bool!
    
    init(name: String, exercises: [Exercise], collapsed: Bool = false) {
        self.sectionTitle = name
        self.exercises = exercises
        self.collapsed = collapsed
    }
}


class AddExerciseVC1: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate  //공유되는 정보 델리게이트
    
    //운동 추가 1 테이블뷰
    @IBOutlet weak var addExTV1: UITableView!
    
    //부위별 섹션
    //가슴, 등, 다리, 팔, 어깨, 코어, 기타
    var exTable = [ExSection]()
    
    //선택된 운동 리스트

    var selectedEx = [Exercise]()
    var selectingCount = 0
    
    
    @IBOutlet weak var addExerciseButton: UIButton!
    
    //취소버튼시 모달 취소
    @IBAction func addExerciseCancel(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveAndReturnWind(_ sender: UIStoryboardSegue) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //버튼 활성화 설정
        addExerciseButton.isEnabled = false
        addExerciseButton.setTitle("운동을 선택해주세요", for: .disabled)
        
        //더미 데이터
//        exTable = [
//            ExSection(name: "가슴", exercises: [Exercise.init(id : 0, name: "벤치프레스"),Exercise.init(id : 1 ,name: "디클라인 벤치프레스"),Exercise.init(id : 2 ,name: "인클라인 벤치프레스")]),
//            ExSection(name: "등", exercises: [Exercise.init(id : 3 ,name: "1_1"),Exercise.init(id : 4 ,name: "1_2"),Exercise.init(id : 5 ,name: "1_3")]),
//            ExSection(name: "다리", exercises: [Exercise.init(id : 6 ,name: "2_1"),Exercise.init(id : 7 ,name: "2_2"),Exercise.init(id : 8 ,name: "2_3")])
//        ]
        exTable = [
            ExSection(name: "가슴", exercises: [Exercise.init(name: "벤치프레스"),Exercise.init(name: "디클라인 벤치프레스"),Exercise.init(name: "인클라인 벤치프레스")]),
            ExSection(name: "등", exercises: [Exercise.init(name: "1_1"),Exercise.init(name: "1_2"),Exercise.init(name: "1_3")]),
            ExSection(name: "다리", exercises: [Exercise.init(name: "2_1"),Exercise.init(name: "2_2"),Exercise.init(name: "2_3")])
        ]
    }
    

    // MARK: - Table view data source
    
    //체크마크 설정
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        if let cell = tableView.cellForRow(at: indexPath) as? AddExerciseCell {
            
            //클릭시 선택자 설정 및 체크마크 설정
            exTable[indexPath.section].exercises[indexPath.row].selected = true
            cell.accessoryType = .checkmark
            
            //선택된 운동 배열에 삽입
            selectedEx.append(exTable[indexPath.section].exercises[indexPath.row])
            
            //선택된 운동 순서 설정
            exTable[indexPath.section].exercises[indexPath.row].id = selectedEx.findObjectIndex(object: exTable[indexPath.section].exercises[indexPath.row])
            
            selectingCount += 1 //선택시 숫자 증가
            
            //선택된 운동 순서 텍스트에 표시
            cell.exNumber.text = "\(exTable[indexPath.section].exercises[indexPath.row].id!)"

        }
        
        //버튼 활성화 및 버튼 타이틀 변경
        if selectedEx.count != 0 {
            addExerciseButton.isEnabled = true
            addExerciseButton.setTitle("선택된 운동 (\(selectingCount))", for: .normal)
        }
    }
    
    //체크마크 비설정
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? AddExerciseCell {
            
            //클릭 해제시 선택자 해제 및 체크마크 해제
            exTable[indexPath.section].exercises[indexPath.row].selected = false
            cell.accessoryType = .none
            cell.exNumber.text = "" //그 자리 셀 빈칸으로 지정
            
            //객체 찾아서 삭제
            selectedEx.removeObject(object : exTable[indexPath.section].exercises[indexPath.row])
            
            print("삭제됬을때 리스트", selectedEx)
            selectingCount -= 1 //선택해제시 카운트 해제
            
        }
        
        //버튼 비활성화 및 버튼 타이틀 변경
        if selectedEx.count == 0 {
            
            addExerciseButton.isEnabled = false
            addExerciseButton.setTitle("운동을 선택해주세요", for: .disabled)
            
        } else {
            addExerciseButton.setTitle("선택된 운동 (\(selectingCount))", for: .normal)
        }
        
        tableView.reloadData()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let destinationVC = segue.destination as! AddExerciseVC2
        
//        print("보내기전 리스트",selectedEx)
        destinationVC.selectedExList = selectedEx
        
    }
    
}


////test
extension AddExerciseVC1 {
    
    //섹션 수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        //부위 별 섹션 갯수
        return exTable.count
    }
    
    //운동섹션 속 부위별 운동 갯수만큼 테이블 행 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return exTable[section].exercises.count
    }
    
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let exSectionNum = indexPath.section
        let exTitleNum = indexPath.row
        
        //선택된 운동 셀
        let Ex = exTable[indexPath.section].exercises[indexPath.row]
        
        //운동추가셀로 지정
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseListCell_1") as! AddExerciseCell
        
        //운동명 지정
        cell.titleLabel.text = exTable[exSectionNum].exercises[exTitleNum].name
        
        
        //테이블 함축했을때 이용
            //운동들이 선택됬는지 체크 후 다시 마킹
        if exTable[exSectionNum].exercises[exTitleNum].selected == true {
            
            cell.accessoryType = .checkmark
            //선택된 운동의 인덱스 값을 운동 id 값으로 대입
            Ex.id = selectedEx.findObjectIndex(object: Ex)
            
//            print("선택하는 id값",selectedEx.findObjectIndex(object: Ex))
//            print("대입된 id값",Ex)
            
            //운동 id 값을 선택된 순서 값으로 표현
            cell.exNumber.text = "\(Ex.id!)"
            //테이블 선택되는 거 체크
            addExTV1.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            
            //운동들이 체크가 아니였다면 다시 아닌걸로 마킹
        } else {
            cell.accessoryType = .none
            cell.exNumber.text = ""
            //테이블 선택되는 거 비체크
            addExTV1.deselectRow(at: indexPath, animated: false)
        }
        
        return cell
    }
    
    //테이블이 펼쳐졌을때 높이 및 줄어들었을때 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return exTable[indexPath.section].collapsed! ? 44.0 : 0
        
    }
    
    // 헤드 구현 부분
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? AddEx01Header ?? AddEx01Header(reuseIdentifier: "header")
        
        header.titleLabel.text = exTable[section].sectionTitle
        header.arrowLabel.text = ">"
        header.setCollapsed(exTable[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    //헤더 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    //푸터 높이 설정
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

//
// MARK: - Section Header Delegate
//

//헤더 델리게이트를 구현 토글링
extension AddExerciseVC1: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: AddEx01Header, section: Int) {
        let collapsed = !exTable[section].collapsed
        
        // Toggle collapse
        exTable[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        // Adjust the height of the rows inside the section
        addExTV1.beginUpdates()
        for i in 0 ..< exTable[section].exercises.count {
            addExTV1.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        addExTV1.endUpdates()
    }
    
}
