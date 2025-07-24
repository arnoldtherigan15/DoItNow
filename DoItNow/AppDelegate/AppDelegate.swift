//
//  AppDelegate.swift
//  DoItNow
//
//  Created by Arnold Therigan on 24/07/25.
//

import UIKit
import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("App Launched!")
        return true
    }

    // Handle notifications, background tasks, etc.
    func applicationWillResignActive(_ application: UIApplication) {
        print("App will resign active")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("App did enter background")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("App will enter foreground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("App became active")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("App will terminate")
    }
}
