//
//  DataController.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 22..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit
import Firebase
import Foundation

class DataController: NSObject {
    
    
    //MARK: 2. firebase 데이터 베이스 인스턴스 받아옴
//    var ref: FIRDatabaseReference!
    
    
    //MARK: 1. 싱글톤 패턴
    struct StaticInstance {
        static var instance: DataController?
    }
    
    class func sharedInstance() -> DataController {
        if !(StaticInstance.instance != nil) {
            StaticInstance.instance = DataController()
        }
        return StaticInstance.instance!
    }
    
    //MARK: 요구사항 저장
//    public func addRequirement(reqId: Int, traId: String , reqText: String, inImage: String) {
//        
//        self.ref = FIRDatabase.database().reference()
//        let key = ref.child("requirement").childByAutoId()
//        let fireRequirement = ["requirementId":reqId, "trainerId":traId,"requirementText":reqText,"inbodyImage":inImage, "arrayTest": ["hello"]] as [String : Any]
//        print(fireRequirement)
//        key.setValue(fireRequirement)
//        
//    }
    
    //MARK: 스케줄 저장
//    public func addSchedule(exSummary : String, title : String, exerciseList : [Exercise]) {
//        
//        self.ref = FIRDatabase.database().reference()
//        
//        var exList = [String]()
//        
//        //운동리스트 이름들 삽입
//        for ex in exerciseList {
//            exList.append(ex.name!)
//        }
//        
//        let key = ref.child("schedule").childByAutoId()
//        let fireSchedule = ["exSummary": exSummary, "title" : title , "exList" : exList] as [String : Any]
//        key.setValue(fireSchedule)
//        
//    }
    
    
    //Firebase Test 데이터 뿌리기 테스트
//    public func testFirebase() -> Array {
//        
//        self.ref = FIRDatabase.database().reference()
//        let scheduleRef = ref.child("schedule")
//        let scheduleList = []
//        
//        scheduleRef.observe(.childAdded, with:{
//            (snap) in
//            if let schedule = snap.value as? [String : Any] {
//                let title = schedule["title"] as? String
//                print("스케줄이름",title!)
//                let exList = schedule["exList"] as! NSArray
//                print("운동 1번",exList[0])
//                let exSummary = schedule["exSummary"] as? String
//                print("운동 요약",exSummary!)
//                
//                let dic : [String : Any] = ["title": title, "exSummary":exSummary,"exList":exList]
//                scheduleList.append(dic)
//            }
//        })
//        
//        return scheduleList
//        
//    }
    
    //MARK: 4
//    public func getTodos() -> Array<String> {
//        return self.todos
//    }
//    
//    //MARK: 5 특정 String 리턴
//    public func getTodoString(index: Int) -> String {
//        return self.todos[index]
//    }
    
}
