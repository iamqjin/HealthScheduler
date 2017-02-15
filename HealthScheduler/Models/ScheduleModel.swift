//
//  ScheduleModel.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

struct Schedule {
    
    var scheduleId : Int? //스케줄 id값
    
    var exSummary : String? //운동 세트 요약
    
    var title : String? //스케줄 타이틀
    
    var exerciseList = [Exercise]() //루틴 안 운동들
    
}
