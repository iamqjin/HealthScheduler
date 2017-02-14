//
//  ExerciseSections.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 9..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

//운동 섹션 구조
struct ExSection {
    var sectionTitle: String!
    var exercises: [Exercise]!
    var collapsed: Bool!
    
    init(name: String, exercises: [Exercise], collapsed: Bool = false) {
        self.sectionTitle = name
        self.exercises = exercises
        self.collapsed = collapsed
    }
}


