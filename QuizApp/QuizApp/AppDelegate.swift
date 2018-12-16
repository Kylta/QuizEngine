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

       let viewController = ResultViewController(summary: "You got 1/2 correct", answers: [
        PresentableAnswer(question: "Question ??", answer: "Yeahh !", wrongAnswer: nil),
        PresentableAnswer(question: "Another Question ??", answer: "Hell yeah !", wrongAnswer: "Helll noooo !!")
        ])

        let navController = UINavigationController(rootViewController: viewController)

        window?.rootViewController = navController

        return true
    }
}

