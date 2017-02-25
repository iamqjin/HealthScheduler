//
//  AppDelegate.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 6..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit
import COSTouchVisualizer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,COSTouchVisualizerWindowDelegate {
    
    internal var window: UIWindow? = {
        let customWindow = COSTouchVisualizerWindow(frame: UIScreen.main.bounds)
        
        customWindow.fillColor = UIColor.gray
//        customWindow.strokeColor = UIColor.black
        customWindow.touchAlpha = 0.4;
        
        customWindow.rippleFillColor = UIColor.gray
//        customWindow.rippleStrokeColor = UIColor.black
        customWindow.touchAlpha = 0.5;
        
        return customWindow
    }()
    
//    var window: UIWindow?
    
    //공유할 스케줄 모델
    var scheduleList = [Schedule]()
    //트레이너가 짜준 스케줄 모델
    var tScheduleList = [TSchedule]()
    //히스토리 모델
    var historyList = [History]()
    //트레이너 모델
    var trainerList = [TrainerModel]()
    //요구사항 모델
    var requirementList = [Requirement]()
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        guard let window = window as? COSTouchVisualizerWindow else {
            return false
        }
        window.touchVisualizerWindowDelegate = self
        
        return true
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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

    func touchVisualizerWindowShouldAlwaysShowFingertip(_ window: COSTouchVisualizerWindow!) -> Bool {
        // Return YES to make the fingertip always display even if there's no any mirrored screen.
        // Return NO or don't implement this method if you want to keep the fingertip display only when
        // the device is connected to a mirrored screen.
        return true
    }
    
    func touchVisualizerWindowShouldShowFingertip(_ window: COSTouchVisualizerWindow!) -> Bool {
        // Return YES or don't implement this method to make this window show fingertip when necessary.
        // Return NO to make this window not to show fingertip.
        return true
    }

}

