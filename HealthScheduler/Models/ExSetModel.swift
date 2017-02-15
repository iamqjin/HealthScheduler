//
//  ExSet.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

class ExSet {
    
    var setId : Int? //세트 id
    
    var weight : Int? //무게
    
    var count : Int? //횟수
    
    var passOrFail : Bool? //성공 여부
    
    init() {

    }
    
    init(setId : Int?) {
        self.setId = setId
    }
}
