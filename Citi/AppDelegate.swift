//
//  AppDelegate.swift
//  Citi
//
//  Created by Darrell Shi on 9/15/16.
//  Copyright © 2016 Citi. All rights reserved.
//

import UIKit
import CoreData
import AWSCore
import GoogleMaps
import GooglePlaces
import AWSCognitoIdentityProvider

let identityPoolId = "us-east-1:7fb95e03-4940-417c-a8e9-8020f88b25b6"
let poolKey = "Citi Users"
let poolId = "us-east-1_FJzTqCTMi"
let appClientId = "57d2o255pe5p54hrhg8lb8p6ec"
let appClientSecret = "i9eak0j8pdg1q9j9jnqok3qipp971otc71s5l5oh5grcjrg579d"
let APIKey = "AIzaSyCxTvFZZCOAbefTC8JyTbrQxX_4_IHjgX8"

var pool: AWSCognitoIdentityUserPool!
var currUser: AWSCognitoIdentityUser!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let credentialsProvider = AWSCognitoCredentialsProvider(
            regionType: AWSRegionType.usEast1,
            identityPoolId: identityPoolId)
        let configuration = AWSServiceConfiguration(
            region: AWSRegionType.usEast1,
            credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        //create and register user pool
        let userPoolConfiguration = AWSCognitoIdentityUserPoolConfiguration(clientId: appClientId, clientSecret: appClientSecret, poolId: poolId)
        AWSCognitoIdentityUserPool.registerCognitoIdentityUserPool(with: userPoolConfiguration, forKey: poolKey)
        
        pool = AWSCognitoIdentityUserPool(forKey: poolKey)
        
        GMSServices.provideAPIKey(APIKey)
        GMSPlacesClient.provideAPIKey(APIKey)
        
        // Override point for customization after application launch.
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


}
