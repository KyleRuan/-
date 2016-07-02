//
//  AppDelegate.swift
//  Lottery
//
//  Created by Jason on 16/6/28.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    guard let window = self.window else {
      return false
    }
  
    let oldVersion = NSUserDefaults.standardUserDefaults().stringForKey(Constants.AppInfo.appVersion)
    guard let newVersion = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String  else {
      fatalError("the Info.plist cant'n open ")
    }
    
    if oldVersion == newVersion {
      // 这里进入主分支
      window.backgroundColor = UIColor.redColor()
      let tabBarVC = KRTabBarController()
      window.rootViewController = tabBarVC
    } else {
      let vc = KRNewFeatureViewController()
      window.rootViewController  = vc
      NSUserDefaults.standardUserDefaults().setObject(newVersion, forKey: Constants.AppInfo.appVersion)
    }
    window.makeKeyAndVisible()
    return true
  }
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}

