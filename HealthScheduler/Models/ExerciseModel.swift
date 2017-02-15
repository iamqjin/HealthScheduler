//
//  Exercise.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

class Exercise : Equatable {
    
    
    var id : Int? //운동 id
    var name : String? //운동 이름
    var selected : Bool = false //테이블 선택자
    var exSetCount : Int? //운동 세트수
    var exSetList = [ExSet]() //운동 안 세트들
        
    
    init() {
        
    }
    
    init(name : String, exSetCount : Int = 3) {
        self.name = name
        self.exSetCount = exSetCount
    }
    
}

func ==(lhs: Exercise, rhs: Exercise) -> Bool {
    return lhs.name == rhs.name
}
