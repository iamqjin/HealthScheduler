//
//  HistoryModel.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 13..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

struct History {

    var historyId : Int?//히스토리 id
    
    var scheduleTitle : String? //진행했던 스케줄 제목
    
    var progressImage : UIImage? //진행 사진
    
    var startTime : String? //시작 시간
    
    var endTime : String? //끝 시간
    
    var totalTime : String? //시작부터 끝시간
    
    var totalTimeMinOrSec : String? //총 초 혹은 분
    
    var date : String?//운동 날짜
    
    var preogressTable : String? //운동 진행 상황
    
    var totalWeight : Int?
    
    var percent : String?
    
    init(){
        
    }
    
    //이미지 없는 초기화
    init(scheduleTitle : String, startTime : String, endTime : String, date : String, progressTable : String, totalTimeMinOrSec : String, totalWeight : Int, percent : String) {
        self.scheduleTitle = scheduleTitle
        self.startTime = startTime
        self.endTime = endTime
        self.totalTime = startTime + " - " + endTime
        self.date = date
        self.preogressTable = progressTable
        self.totalTimeMinOrSec = totalTimeMinOrSec
        self.totalWeight = totalWeight
        self.percent = percent
    }
    
    //이미지 있는 초기화
    init(scheduleTitle : String, progressImage : UIImage, startTime : String, endTime : String, date : String, progressTable : String, totalTimeMinOrSec : String,totalWeight : Int, percent : String) {
        self.scheduleTitle = scheduleTitle
        self.progressImage = progressImage
        self.startTime = startTime
        self.endTime = endTime
        self.totalTime = startTime + " - " + endTime
        self.date = date
        self.preogressTable = progressTable
        self.totalTimeMinOrSec = totalTimeMinOrSec
        self.totalWeight = totalWeight
        self.percent = percent
    }

}
