//
//  SceneDelegate.swift
//  DoItNow
//
//  Created by Arnold Therigan on 24/07/25.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Create the window
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        // Set the initial view as SplashScreen
        let splashView = SplashScreenView()
        window.rootViewController = UIHostingController(rootView: splashView)
        window.makeKeyAndVisible()
    }
    
    // Other lifecycle methods (not needed in this example)
}
