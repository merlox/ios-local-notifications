//
//  AppDelegate.swift
//  LocalNotifications
//
//  Created by Merunas Grincalaitis on 22/03/2020.
//  Copyright © 2020 Merunas Grincalaitis. All rights reserved.
//
// This is the basic UserNotifications example
// to show you how it's done, no filters

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 1. Ask for permission
        let current = UNUserNotificationCenter.current()
        current.requestAuthorization(options: [.alert, .sound, .badge]) { (granted: Bool, err: Error?) in
            if !granted {
                print("Permission NOT granted")
            } else {
                print("Permission granted")
            }
        }
        
        // 2. Create a notification
        let notification = UNMutableNotificationContent()
        notification.title = "Notification title"
        notification.body = "This is my notification"
        
        // 3. Trigger the notification every 60 second:
        // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        // Everyday at 8am:
        var date = DateComponents()
        date.hour = 8
        date.minute = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        let identifier = "UniqueNotificationMerunas"
        // You can setup multiple with different identifiers like so
        // let identifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: notification, trigger: trigger)
        current.add(request) { (error : Error?) in
             if let theError = error {
                 print("Found an error", theError)
             }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

