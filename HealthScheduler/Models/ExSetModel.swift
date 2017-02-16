//
//  ExSet.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

class ExSet {
    
    var exTitle : String? //운동 타이틀
    
    var setId : Int? //세트 id
    
    var weight : String? //무게
    
    var count : String? //횟수
    
    var passOrFail : String? //성공 여부
    
    init() {

    }
    
    init(exTitle : String? , setId : Int?) {
        self.exTitle = exTitle
        self.setId = setId
    }
    
    
    func setAllData(weight : String , count : String , passOrFail : String){
        self.weight = weight
        self.count = count
        self.passOrFail = passOrFail
    }
    
}
