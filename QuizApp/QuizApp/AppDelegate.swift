//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Christophe Bugnon on 16/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.makeKeyAndVisible()

        let questionViewController = QuestionViewController(question: "A question ?", options: ["Option 1", "Option 2"]) {
            print($0)
        }

        let navController = UINavigationController(rootViewController: questionViewController)

        window?.rootViewController = navController

        return true
    }
}

