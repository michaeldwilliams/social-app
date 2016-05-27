//
//  AppDelegate.swift
//  social
//
//  Created by Michael Williams on 5/22/16.
//  Copyright © 2016 Michael Williams. All rights reserved.
//

import UIKit
import Firebase
import BLKFlexibleHeightBar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        
        window!.makeKeyAndVisible()
        let feedController = FeedController()
        let navigationController = UINavigationController(rootViewController: feedController)
        let tabBarController = TabBarController()
        let vc1 = navigationController
        let vc3 = ProfileViewController()
        let vc2 = SocialsViewController()
        tabBarController.setViewControllers([vc1, vc2, vc3], animated: true)
        window?.rootViewController = tabBarController
        UINavigationBar.appearance().barTintColor = UIColor.rgb(248, green: 148, blue: 6)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        let feedImage = UIImage(named: "feed")
        let feedImageSelected = UIImage(named: "feed_selected")
        let socialsImage = UIImage(named: "socials")
        let socialsImageSelected = UIImage(named: "socials_selected")
        let profileImage = UIImage(named: "profile")
        let profileImageSelected = UIImage(named: "profile_selected")
        vc1.tabBarItem = UITabBarItem(title: "Feed", image: feedImage, selectedImage: feedImageSelected)
        vc2.tabBarItem = UITabBarItem(title: "Socials", image: socialsImage, selectedImage: socialsImageSelected)
        vc3.tabBarItem = UITabBarItem(title: "Me", image: profileImage, selectedImage: profileImageSelected)
        application.statusBarStyle = .LightContent
        
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

