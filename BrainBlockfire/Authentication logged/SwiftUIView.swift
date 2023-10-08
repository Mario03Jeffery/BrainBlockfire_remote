//
//  SwiftUIView.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-05-25.
//

import SwiftUI
import Firebase

struct SwiftUIView: View {
    
    @State var isloggedin = false
    
    
    var body: some View {
        VStack{
             
             
             if(isloggedin)
             {
                 MultiplayerView()
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
         }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
