//
//  AppDelegate.swift
//  Birthdays
//
//  Created by Олег Романов on 26.07.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    static var shared: AppDelegate?

    lazy var window: UIWindow? = UIWindow()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.shared = self
        window?.rootViewController = OnboardingController()
        window?.makeKeyAndVisible()

        return true
    }
}
