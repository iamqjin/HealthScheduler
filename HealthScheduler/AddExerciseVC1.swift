//
//  AddExerciseVC1.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit


class AddExerciseVC1: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate  //공유되는 정보 델리게이트
    
    //운동 추가 1 테이블뷰
    @IBOutlet weak var addExTV1: UITableView!
    
    //부위별 섹션
    //가슴, 등, 다리, 팔, 어깨, 코어, 기타
    var exTable = [ExSection]()
    
    //선택된 운동 리스트
    var selectedEx = [Exercise]()
    //선택된 운동 수
    var selectingCount = 0
    
    
    @IBOutlet weak var addExerciseButton: UIButton!
    
    //취소버튼시 모달 취소
    @IBAction func addExerciseCancel(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //버튼 활성화 설정
        addExerciseButton.isEnabled = false
        
        //더미 데이터
        exTable = [ExSection(name: "가슴", exercises: [Exercise.init(name:"벤치 프레스 - 머신"), Exercise.init(name:"벤치 프레스 - 바벨, 플랫"), Exercise.init(name:"벤치 프레스 - 덤벨, 플랫"), Exercise.init(name:"벤치 프레스 - 바벨, 인클라인"), Exercise.init(name:"벤치 프레스 - 덤벨, 인클라인"), Exercise.init(name:"플라이 - 덤벨, 인클라인"), Exercise.init(name:"벤치 프레스 - 바벨, 디클라인"), Exercise.init(name:"벤치 프레스 - 덤벨, 디클라인"), Exercise.init(name:"플라이 - 덤벨, 플랫"), Exercise.init(name:"풀오버 - 덤벨, 플랫"), Exercise.init(name:"플라이 - 펙 덱 머신"), Exercise.init(name:"딥스"), Exercise.init(name:"푸시업"), Exercise.init(name:"니 푸시업"), Exercise.init(name:"크로스 오버 - 케이블"), Exercise.init(name:"푸시업 사이드 점프")]),
                   
                   ExSection(name: "등", exercises: [Exercise.init(name:"랫 풀 다운 - 머신"), Exercise.init(name:"로우 - 바벨, 벤트 오버"), Exercise.init(name:"로우 - 덤벨, 벤트 오버"), Exercise.init(name:"로우 - 덤벨, 원 암"), Exercise.init(name:"로우 - 케이블, 시티드"), Exercise.init(name:"로우 - 티바"), Exercise.init(name:"풀업 - 어시스티드"), Exercise.init(name:"슈퍼맨 등 운동"), Exercise.init(name:"로우 - 밴드, 시티드")]),
                   
                   ExSection(name: "다리", exercises: [Exercise.init(name:"스쿼트 - 바벨"), Exercise.init(name:"스쿼트 - 덤벨"), Exercise.init(name:"스쿼트 - 스미스 머신"), Exercise.init(name:"레그 프레스"), Exercise.init(name:"런지 - 바벨"), Exercise.init(name:"레그 익스텐션"), Exercise.init(name:"스텝업 - 덤벨"), Exercise.init(name:"사이드 런지"), Exercise.init(name:"점프 스쿼트"), Exercise.init(name:"와이드 스쿼트"), Exercise.init(name:"런지"), Exercise.init(name:"레그 컬 - 스탠딩"), Exercise.init(name:"레그 컬 - 라잉"), Exercise.init(name:"데드리프트 - 바벨, 스티프 레그드"), Exercise.init(name:"멀티힙"), Exercise.init(name:"카프 레이즈 - 스탠딩"), Exercise.init(name:"카프 레이즈 - 시티드"), Exercise.init(name:"카프 레이즈 - 싱글 레그"), Exercise.init(name:"카프 프레스 - 머신")]),
                   
                   ExSection(name: "팔", exercises: [Exercise.init(name:"컬 프레스 - 덤벨"), Exercise.init(name:"컬 - 덤벨, 인클라인"), Exercise.init(name:"컬 - 바벨"), Exercise.init(name:"리버스 컬 - 바벨"), Exercise.init(name:"컬 - 덤벨"), Exercise.init(name:"해머 컬 - 덤벨"), Exercise.init(name:"프리쳐 컬 - 바벨"), Exercise.init(name:"콘센트레이션 컬 - 덤벨"), Exercise.init(name:"컬 - 케이블"), Exercise.init(name:"컬 - 이지바"), Exercise.init(name:"컬 - 밴드"), Exercise.init(name:"트라이셉스 익스텐션 - 바벨, 라잉"), Exercise.init(name:"트라이셉스 익스텐션 - 덤벨, 라잉"), Exercise.init(name:"트라이셉스 익스텐션 - 덤벨, 오버헤드"), Exercise.init(name:"트라이셉스 익스텐션 - 덤벨, 원 암"), Exercise.init(name:"트라이셉스 프레스 다운 - 케이블"), Exercise.init(name:"킥 백 - 덤벨"), Exercise.init(name:"벤치 프레스 - 바벨, 클로즈 그립"), Exercise.init(name:"딥스 - 벤치"), Exercise.init(name:"리스트 컬 - 바벨"), Exercise.init(name:"리스트 컬 - 덤벨"), Exercise.init(name:"리버스 리스트 컬 - 바벨"), Exercise.init(name:"리버스 리스트 컬 - 덤벨"), Exercise.init(name:"조트맨 컬 - 덤벨"), Exercise.init(name:"프로네이션 - 덤벨"), Exercise.init(name:"슈피네이션 - 덤벨")]),
                   
                   ExSection(name: "어깨", exercises: [Exercise.init(name:"숄더 프레스 - 머신"), Exercise.init(name:"비하인드 넥 프레스 - 스미스 머신"), Exercise.init(name:"숄더 프레스 - 바벨"), Exercise.init(name:"비하인드 넥 프레스 - 바벨"), Exercise.init(name:"숄더 프레스 - 덤벨"), Exercise.init(name:"아놀드 프레스"), Exercise.init(name:"프런트 레이즈 - 덤벨"), Exercise.init(name:"래터럴 레이즈 - 덤벨"), Exercise.init(name:"래터럴 레이즈 - 덤벨, 벤트 오버"), Exercise.init(name:"업라이트 로우 - 바벨"), Exercise.init(name:"쉬러그 - 덤벨"), Exercise.init(name:"이지 클린")]),
                   
                   ExSection(name: "허리", exercises: [Exercise.init(name:"데드리프트 - 바벨"), Exercise.init(name:"데드리프트 - 덤벨"), Exercise.init(name:"굿모닝 - 바벨"), Exercise.init(name:"백 익스텐션"), Exercise.init(name:"굿모닝"), Exercise.init(name:"굿모닝 - 덤벨")]),
                   
                   ExSection(name: "복부", exercises: [Exercise.init(name:"싯업"), Exercise.init(name:"크런치"), Exercise.init(name:"리버스 크런치"), Exercise.init(name:"크런치 - 케이블"), Exercise.init(name:"레그 레이즈"), Exercise.init(name:"레그 레이즈 - 서포티드"), Exercise.init(name:"레그 레이즈 - 행잉"), Exercise.init(name:"V업"), Exercise.init(name:"니업 - 시티드"), Exercise.init(name:"오블리크 크런치"), Exercise.init(name:"사이드 벤드 - 덤벨"), Exercise.init(name:"리버스 트렁크 트위스트"), Exercise.init(name:"크로스 크런치"), Exercise.init(name:"러시안 트위스트"), Exercise.init(name:"사이드 크런치"), Exercise.init(name:"사이드 벤드 - 밴드"), Exercise.init(name:"양손 다리 모으기"), Exercise.init(name:"엎드려 점프"), Exercise.init(name:"다리 교차 뛰기")])
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
