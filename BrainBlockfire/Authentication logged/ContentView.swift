//
//  ContentView.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-05-24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @AppStorage("isUserAuthenticated") private var isUserAuthenticated = false
    @State var isloading = true
    @State var isloggedin = false
    
    var body: some View {
        
       
        
        VStack {
            
            VStack{
                
                
                if(isloggedin)
                {
                   SinglePlayer_or_MultiplayerView()
                } else {
                    HomeView()
                }
                
            }.onAppear() {
                _ = Auth.auth().addStateDidChangeListener { auth, user in
                    
                    if(Auth.auth().currentUser == nil)
                    {
                        isloggedin = false
                    } else {
                        isloggedin = true
                    }
                }
            
            
            
            
            
                if (isloading) {
                    loadingGraf()
                        .onAppear {
                            authenticateUser()
                        }
                } else {
                    if isUserAuthenticated{
                        HomeView()
                    } else {
                        HomeView()
                    }
                }
           
            
            
            }
            
            
            
        }
       
    }
    
    private func authenticateUser() {
            // Simulate a delay to show the loading animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Check if the user is authenticated
                // You can use Core Data to check if the user is logged in
                // Update the "isUserAuthenticated" AppStorage accordingly
                
                isloading = false
              
            }
        }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
