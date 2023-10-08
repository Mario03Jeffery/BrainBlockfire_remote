//
//  BrainBlockfireApp.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-05-24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn


class AppDelegate: NSObject, UIApplicationDelegate {
    internal func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:  [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        
        FirebaseApp.configure()
        
      //  GIDSignIn.sharedInstance.clientID = "560762528984-lrpeithec08qr16agde5po827n2ce3gd.apps.googleusercontent.com"
        
        return true
        
    }
    
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
       
       
        
        FirebaseApp.configure()
        
     
        
       
        
        return GIDSignIn.sharedInstance.handle(url)
        
        
         
        
    }
 
    
    
}




import SwiftUI

@main
struct FirebaseAPP: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                    
                }
            
            
            }
        
      
    }
    
    

