//
//  ScheduleModel.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 8..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

struct ScheduleModel {
    
    var title : String? //스케줄 타이틀
    
    var progressImage : String? //진행 사진
    
    var startTime : String? //시작 시간
    
    var endTime : String? //끝 시간
    
    var date : String?//운동 날짜
    
    var routine = [Exercise()] //루틴 안 운동들
    
}
