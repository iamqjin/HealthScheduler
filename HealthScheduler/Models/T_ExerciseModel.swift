//
//  T_ExerciseModel.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 21..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

class TExercise {
    
    
    var id : Int? //운동 id
    var name : String? //운동 이름
    var passOrFail : String? //성공 실패 여부
    var weight : String?
    var count : String?
    
    init() {
        
    }
    
    init(id : Int , name : String, passOrFail : String, weight: String, count : String) {
        self.id = id
        self.name = name
        self.passOrFail = passOrFail
        self.weight = weight
        self.count = count
    }
    
//    바벨 숄더 프레스 x 3, 아놀드 프레스 x 3, 비하인드 넥 프레스 x 3,레트럴 레이즈 x 3
    func makeSchedule() -> [TExercise] {
        var tSchedule = [TExercise]()
        
        for ex in ["바벨 숄더 프레스","아놀드 프레스","비하인드 넥 프레스","레트럴 레이즈"] {
            for i in 0..<3 {
                tSchedule.append(TExercise(id: i, name: ex, passOrFail: "", weight: "\(10 + i*5)kg", count: "\(10 + i*2)회"))
            }
        }
        
        return tSchedule
    }
}
