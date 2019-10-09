//
//  AppDelegate.swift
//  ScanbotSdkWebKitNativeBridgeExample
//
//  Created by Eddy on 09.10.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // This is just a trial license key!
        // After the trial period is over all Scanbot SDK functions as well as the UI components will stop working
        // or may be terminated. You can get an unrestricted "no-strings-attached" 30 day trial license key for free:
        // https://scanbot.io/sdk/trial.html
        ScanbotSDK.setLicense(
            "K+VV8ez6/8V5e77hQWfEem9eehpJAQ" +
            "28jHmUTgB2hCER0pg/+I0chGc9/4IK" +
            "ah5w6P6r6JLBqHKwl/fGDUJ1ifrGxl" +
            "qBplfB5TsP7AKJnrCTopkA3eWe2bu8" +
            "b0MBqngJsO32o4rz4SSEsbf3ZyGCmg" +
            "1ARJ+1pSXrtxtDa6etLy4zPbMy/cJm" +
            "WVp9vyHXRGoucok83Ql8EGI1KCZQ0f" +
            "qmfUV3YOB6zkXmlV69sfH6uK9cTQ0p" +
            "t5z7HTa/qt8qpGXRiIdx6648q3X7j1" +
            "2Lct3W/HXkElpDqGSmnzRlMYhAMNy4" +
            "0/e1GFBAToijWXQZJ9z0WCeM+S+ZJ7" +
            "ED3r16nXVWYw==\nU2NhbmJvdFNESw" +
            "ppby5zY2FuYm90LmV4YW1wbGUuc2Rr" +
            "LlNjYW5ib3RTZGtXZWJLaXROYXRpdm" +
            "VCcmlkZ2VFeGFtcGxlCjE1NzMzNDM5" +
            "OTkKNTkwCjE=\n")

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

