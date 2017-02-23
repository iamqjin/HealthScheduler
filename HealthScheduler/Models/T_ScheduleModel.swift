//
//  T_ScheduleModel.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 21..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

struct TSchedule {
    
    var exSummary : String? //운동 세트 요약
    
    var title : String? //스케줄 타이틀
    
    var exerciseList = [TExercise]() //루틴 안 운동들

    init(exSummary : String, title : String, exerciseList : [TExercise]) {
        self.exSummary = exSummary
        self.title = title
        self.exerciseList = exerciseList
    }
}
