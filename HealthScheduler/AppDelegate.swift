//
//  AppDelegate.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 6..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , GIDSignInDelegate {

    var window: UIWindow?
    
    //공유할 스케줄 모델
    var scheduleList = [Schedule]()
    //히스토리 모델
    var historyList = [History]()
    //요구사항 모델
    var requirementList = [Requirement]()
    //트레이너 모델
    var trainerList = [TrainerModel]()
    
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String!, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!, accessToken: (authentication?.accessToken)!)
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
            if let user = user {
                print("firebase인증", user)
            }
            
            if let error = error {
                print("firebase오류", error)
            }
            
            
        }
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FIRApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        //로컬 알림 test 알림 받는 인증
//        let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//        application.registerUserNotificationSettings(setting)
        
        
//        UINavigationBar.appearance().tintColor = UIColor.white
//        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
//        UINavigationBar.appearance().barTintColor = UIColor(red: 3/255.0, green: 121/255.0, blue: 251/255.0, alpha: 1.0)
        
//        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
//        statusBar.backgroundColor = UIColor(red:0.96, green:0.78, blue:0.34, alpha:1.0)
//        UIApplication.shared.statusBarStyle = .lightContent
        
        return true
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        //로컬 알림 test
//        if #available(iOS 11.0, *) {
//            //새 방식의 로컬알림 구현 코드
//        } else {
//            //구 방식
//            //알림 설정 확인
//            let setting = application.currentUserNotificationSettings
//            
//            //알림 설정이 되어 있지 않다면 로컬 알림을 보내도 받을 수 없으므로 종료함
//            guard setting?.types != .none else {
//                print("캔트 스케줄")
//                return
//            }
//            
//            //로컬 알람 인스턴스 생성
//            let noti = UILocalNotification()
//            noti.fireDate = Date(timeIntervalSinceReferenceDate: 10) //10초 후 발송
//            noti.timeZone = TimeZone.autoupdatingCurrent //현재 위치에 따라 타임존 설정
//            noti.alertBody = "얼른 다시 접속하셈" //표시될 메세지
////            noti.alertAction = "학습하기" //잠금 상태일 때 표시될 액션 앞에 (밀어서)라는 말 붙음
//            noti.applicationIconBadgeNumber = 1 //앱 아이콘 모서리에 표시될 배지
//            noti.soundName = UILocalNotificationDefaultSoundName //로컬 알람 도착시 사운드
//            noti.userInfo = ["name" : "홍길동"] //로컬 알람 실행시 함께 전달하고 싶은 값, 화면에서 표시되지 않음
//            
//            //생성된 알람 객체를 스케줄러에 등록
//            application.scheduleLocalNotification(noti)
//        }
        
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

