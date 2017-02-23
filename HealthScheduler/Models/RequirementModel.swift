//
//  Requirement.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 20..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

class Requirement {
    
    var requirementId : Int?
    
    var trainerId : String?
    
    var requirementText : String?
    
//    DT
    var inbodyImage : UIImage?
//    var inbodyImage : String?
    
    init() {
        
    }
    
    init(requirementId : Int, trainerId : String , requirementText : String , inbodyImage : UIImage) {
        self.requirementId = requirementId
        self.trainerId = trainerId
        self.requirementText = requirementText
        self.inbodyImage = inbodyImage
    }
    
    //DT
//    init(requirementId : Int, trainerId : String , requirementText : String , inbodyImage : String) {
//        self.requirementId = requirementId
//        self.trainerId = trainerId
//        self.requirementText = requirementText
//        self.inbodyImage = inbodyImage
//    }
    
}
