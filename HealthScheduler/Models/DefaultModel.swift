//
//  DefaultModel.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 16..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import Foundation

struct DefaultModel {
    
    var weightKg = ["1kg", "2kg", "3kg", "4kg", "5kg", "6kg", "7kg", "8kg", "9kg", "10kg", "11kg", "12kg", "13kg", "14kg", "15kg", "16kg", "17kg", "18kg", "19kg", "20kg", "21kg", "22kg", "23kg", "24kg", "25kg", "26kg", "27kg", "28kg", "29kg", "30kg", "31kg", "32kg", "33kg", "34kg", "35kg", "36kg", "37kg", "38kg", "39kg", "40kg", "41kg", "42kg", "43kg", "44kg", "45kg", "46kg", "47kg", "48kg", "49kg", "50kg", "51kg", "52kg", "53kg", "54kg", "55kg", "56kg", "57kg", "58kg", "59kg", "60kg", "61kg", "62kg", "63kg", "64kg", "65kg", "66kg", "67kg", "68kg", "69kg", "70kg", "71kg", "72kg", "73kg", "74kg", "75kg", "76kg", "77kg", "78kg", "79kg", "80kg", "81kg", "82kg", "83kg", "84kg", "85kg", "86kg", "87kg", "88kg", "89kg", "90kg", "91kg", "92kg", "93kg", "94kg", "95kg", "96kg", "97kg", "98kg", "99kg", "100kg"]
    
    var weightLbs = ["1lbs", "2lbs", "3lbs", "4lbs", "5lbs", "6lbs", "7lbs", "8lbs", "9lbs", "10lbs", "11lbs", "12lbs", "13lbs", "14lbs", "15lbs", "16lbs", "17lbs", "18lbs", "19lbs", "20lbs", "21lbs", "22lbs", "23lbs", "24lbs", "25lbs", "26lbs", "27lbs", "28lbs", "29lbs", "30lbs", "31lbs", "32lbs", "33lbs", "34lbs", "35lbs", "36lbs", "37lbs", "38lbs", "39lbs", "40lbs", "41lbs", "42lbs", "43lbs", "44lbs", "45lbs", "46lbs", "47lbs", "48lbs", "49lbs", "50lbs", "51lbs", "52lbs", "53lbs", "54lbs", "55lbs", "56lbs", "57lbs", "58lbs", "59lbs", "60lbs", "61lbs", "62lbs", "63lbs", "64lbs", "65lbs", "66lbs", "67lbs", "68lbs", "69lbs", "70lbs", "71lbs", "72lbs", "73lbs", "74lbs", "75lbs", "76lbs", "77lbs", "78lbs", "79lbs", "80lbs", "81lbs", "82lbs", "83lbs", "84lbs", "85lbs", "86lbs", "87lbs", "88lbs", "89lbs", "90lbs", "91lbs", "92lbs", "93lbs", "94lbs", "95lbs", "96lbs", "97lbs", "98lbs", "99lbs", "100lbs"]
    
    
    var count = ["1회", "2회", "3회", "4회", "5회", "6회", "7회", "8회", "9회", "10회", "11회", "12회", "13회", "14회", "15회", "16회", "17회", "18회", "19회", "20회", "21회", "22회", "23회", "24회", "25회", "26회", "27회", "28회", "29회", "30회", "31회", "32회", "33회", "34회", "35회", "36회", "37회", "38회", "39회", "40회", "41회", "42회", "43회", "44회", "45회", "46회", "47회", "48회", "49회", "50회", "51회", "52회", "53회", "54회", "55회", "56회", "57회", "58회", "59회", "60회", "61회", "62회", "63회", "64회", "65회", "66회", "67회", "68회", "69회", "70회", "71회", "72회", "73회", "74회", "75회", "76회", "77회", "78회", "79회", "80회", "81회", "82회", "83회", "84회", "85회", "86회", "87회", "88회", "89회", "90회", "91회", "92회", "93회", "94회", "95회", "96회", "97회", "98회", "99회", "100회"]
    
    var exList = [ExSection(name: "가슴", exercises: [Exercise.init(name:"벤치 프레스 - 머신"), Exercise.init(name:"벤치 프레스 - 바벨, 플랫"), Exercise.init(name:"벤치 프레스 - 덤벨, 플랫"), Exercise.init(name:"벤치 프레스 - 바벨, 인클라인"), Exercise.init(name:"벤치 프레스 - 덤벨, 인클라인"), Exercise.init(name:"플라이 - 덤벨, 인클라인"), Exercise.init(name:"벤치 프레스 - 바벨, 디클라인"), Exercise.init(name:"벤치 프레스 - 덤벨, 디클라인"), Exercise.init(name:"플라이 - 덤벨, 플랫"), Exercise.init(name:"풀오버 - 덤벨, 플랫"), Exercise.init(name:"플라이 - 펙 덱 머신"), Exercise.init(name:"딥스"), Exercise.init(name:"푸시업"), Exercise.init(name:"니 푸시업"), Exercise.init(name:"크로스 오버 - 케이블"), Exercise.init(name:"푸시업 사이드 점프")]),
                  
                  ExSection(name: "등", exercises: [Exercise.init(name:"랫 풀 다운 - 머신"), Exercise.init(name:"로우 - 바벨, 벤트 오버"), Exercise.init(name:"로우 - 덤벨, 벤트 오버"), Exercise.init(name:"로우 - 덤벨, 원 암"), Exercise.init(name:"로우 - 케이블, 시티드"), Exercise.init(name:"로우 - 티바"), Exercise.init(name:"풀업 - 어시스티드"), Exercise.init(name:"슈퍼맨 등 운동"), Exercise.init(name:"로우 - 밴드, 시티드")]),
                  
                  ExSection(name: "다리", exercises: [Exercise.init(name:"스쿼트 - 바벨"), Exercise.init(name:"스쿼트 - 덤벨"), Exercise.init(name:"스쿼트 - 스미스 머신"), Exercise.init(name:"레그 프레스"), Exercise.init(name:"런지 - 바벨"), Exercise.init(name:"레그 익스텐션"), Exercise.init(name:"스텝업 - 덤벨"), Exercise.init(name:"사이드 런지"), Exercise.init(name:"점프 스쿼트"), Exercise.init(name:"와이드 스쿼트"), Exercise.init(name:"런지"), Exercise.init(name:"레그 컬 - 스탠딩"), Exercise.init(name:"레그 컬 - 라잉"), Exercise.init(name:"데드리프트 - 바벨, 스티프 레그드"), Exercise.init(name:"멀티힙"), Exercise.init(name:"카프 레이즈 - 스탠딩"), Exercise.init(name:"카프 레이즈 - 시티드"), Exercise.init(name:"카프 레이즈 - 싱글 레그"), Exercise.init(name:"카프 프레스 - 머신")]),
                  
                  ExSection(name: "팔", exercises: [Exercise.init(name:"컬 프레스 - 덤벨"), Exercise.init(name:"컬 - 덤벨, 인클라인"), Exercise.init(name:"컬 - 바벨"), Exercise.init(name:"리버스 컬 - 바벨"), Exercise.init(name:"컬 - 덤벨"), Exercise.init(name:"해머 컬 - 덤벨"), Exercise.init(name:"프리쳐 컬 - 바벨"), Exercise.init(name:"콘센트레이션 컬 - 덤벨"), Exercise.init(name:"컬 - 케이블"), Exercise.init(name:"컬 - 이지바"), Exercise.init(name:"컬 - 밴드"), Exercise.init(name:"트라이셉스 익스텐션 - 바벨, 라잉"), Exercise.init(name:"트라이셉스 익스텐션 - 덤벨, 라잉"), Exercise.init(name:"트라이셉스 익스텐션 - 덤벨, 오버헤드"), Exercise.init(name:"트라이셉스 익스텐션 - 덤벨, 원 암"), Exercise.init(name:"트라이셉스 프레스 다운 - 케이블"), Exercise.init(name:"킥 백 - 덤벨"), Exercise.init(name:"벤치 프레스 - 바벨, 클로즈 그립"), Exercise.init(name:"딥스 - 벤치"), Exercise.init(name:"리스트 컬 - 바벨"), Exercise.init(name:"리스트 컬 - 덤벨"), Exercise.init(name:"리버스 리스트 컬 - 바벨"), Exercise.init(name:"리버스 리스트 컬 - 덤벨"), Exercise.init(name:"조트맨 컬 - 덤벨"), Exercise.init(name:"프로네이션 - 덤벨"), Exercise.init(name:"슈피네이션 - 덤벨")]),
                  
                  ExSection(name: "어깨", exercises: [Exercise.init(name:"숄더 프레스 - 머신"), Exercise.init(name:"비하인드 넥 프레스 - 스미스 머신"), Exercise.init(name:"숄더 프레스 - 바벨"), Exercise.init(name:"비하인드 넥 프레스 - 바벨"), Exercise.init(name:"숄더 프레스 - 덤벨"), Exercise.init(name:"아놀드 프레스"), Exercise.init(name:"프런트 레이즈 - 덤벨"), Exercise.init(name:"래터럴 레이즈 - 덤벨"), Exercise.init(name:"래터럴 레이즈 - 덤벨, 벤트 오버"), Exercise.init(name:"업라이트 로우 - 바벨"), Exercise.init(name:"쉬러그 - 덤벨"), Exercise.init(name:"이지 클린")]),
                  
                  ExSection(name: "허리", exercises: [Exercise.init(name:"데드리프트 - 바벨"), Exercise.init(name:"데드리프트 - 덤벨"), Exercise.init(name:"굿모닝 - 바벨"), Exercise.init(name:"백 익스텐션"), Exercise.init(name:"굿모닝"), Exercise.init(name:"굿모닝 - 덤벨")]),
                  
                  ExSection(name: "복부", exercises: [Exercise.init(name:"싯업"), Exercise.init(name:"크런치"), Exercise.init(name:"리버스 크런치"), Exercise.init(name:"크런치 - 케이블"), Exercise.init(name:"레그 레이즈"), Exercise.init(name:"레그 레이즈 - 서포티드"), Exercise.init(name:"레그 레이즈 - 행잉"), Exercise.init(name:"V업"), Exercise.init(name:"니업 - 시티드"), Exercise.init(name:"오블리크 크런치"), Exercise.init(name:"사이드 벤드 - 덤벨"), Exercise.init(name:"리버스 트렁크 트위스트"), Exercise.init(name:"크로스 크런치"), Exercise.init(name:"러시안 트위스트"), Exercise.init(name:"사이드 크런치"), Exercise.init(name:"사이드 벤드 - 밴드"), Exercise.init(name:"양손 다리 모으기"), Exercise.init(name:"엎드려 점프"), Exercise.init(name:"다리 교차 뛰기")])
    ]
    
    func returnWeightKg() -> [String] {
        
        return self.weightKg
        
    }
    
    func returnWeightLbs() -> [String] {
        
        return self.weightLbs
        
    }
    
    func returnCount() -> [String] {
        
        return self.count
        
    }
    
    func returnExList() -> [ExSection] {
        return self.exList
    }
}