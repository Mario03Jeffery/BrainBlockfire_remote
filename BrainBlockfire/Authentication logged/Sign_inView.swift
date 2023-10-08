//
//  Sign_inView.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-05-24.
//

import SwiftUI
import Firebase
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices

struct Sign_inView: View {
    @State var useremail = ""
    @State var userpassword = ""
    @State private var showAlerting = false
    @State var rootViewController = UIViewController()
    
    var ref: DatabaseReference! =
    Database.database().reference()
    
    var body: some View {
        ZStack{
            
            Image("Image1")
                .resizable()
                .opacity(0.7)
                .scaledToFill()
            
            // .ignoresSafeArea()
            
            
            
            
            VStack {
                
                Spacer()
                
                Text("Create Account")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.top)
                
                HStack {
                    
                    TextField("Email", text: $useremail)
                    
                        .frame(width: 300, alignment: .center)
                        .cornerRadius(10.0)
                        .padding()
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                        .padding(.trailing)
                        .padding(.all)
                }
                
                HStack {
                    
                    SecureField("Password", text: $userpassword)
                    
                        .frame(width: 300, alignment: .center)
                        .cornerRadius(10.0)
                        .padding()
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .padding(.trailing)
                        .padding(.all)
                    
                }
              
                
                Button(action: {
                    enterUser()
                    
                }, label: {
                    Text("Sign in")
                        .fontWeight(.bold)
                    
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(.top, 200.0)
                })
                
                .alert("Oops Wrong Email", isPresented: $showAlerting) {
                    Button("OK", role: .cancel) { }
                    
                    }
                
                
                
                Button(action: {
                    usercreate()
                    
                }, label: {
                    Text("Create Account")
                        .fontWeight(.bold)
                    
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(.top, 200.0)
                })
                
                
                Button(action: {
                   Googleloggedin()
                }, label: {
                    Text("Google")
                    
                })
              
                
                
               // GoogleSignInButton()
                               //.frame(width: 200, height: 50)
                               //.padding()
                
                
                
                
                
                
                
                
                
            }  .onAppear(){
                var  handle = Auth.auth().addStateDidChangeListener { auth, user in
                    
                }
                
              
                
                
            }
            
            
            
            
            
            
            
            
            
            
            
           
            
        }
        
        
        
        
    }
    
    
    
    func enterUser(){
      
        
        Auth.auth().signIn(withEmail: useremail, password: userpassword) { authResult, error in
            if (error != nil){
                //misslyckad inlogning
                showAlerting = true
            }
            
            useremail = ""
            userpassword = ""
        }
        
    }
    
    func usercreate(){
        
        
        Auth.auth().createUser(withEmail: useremail, password: userpassword) { authResult, error in
        }
        
        useremail = ""
        userpassword = ""
        
        
        
       // let userid = Auth.auth().currentUser!.uid
        //ref.child("name").child(userid).setValue(usercreate)
    }
    
    
    
   /* func signIn() {
      // 1
      if GIDSignIn.sharedInstance.hasPreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn {  user, error in
            authenticateUser(for: user, with: error)
        }
      } else {
        // 2
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // 3
        let configuration = GIDConfiguration(clientID: clientID)
        
        // 4
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        // 5
        GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) {  user, error in
          authenticateUser(for: user, with: error)
        }
      }
    }*/

    
    
    
    
    
    
    
    
    
    func Googleloggedin(){
        
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

       
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
        
        
        
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) {  result, error in
          guard error == nil else {
           return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
            return
          }

            _ = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

          // ...
        }
        
        
    }
    
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
      // 1
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      // 2
      //guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
        
        
        
        guard let idToken = user?.idToken else { return }
        let accessToken = user?.accessToken
        
        // let authentication = user?.authentication

      
      //let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                       accessToken: accessToken!.tokenString)
        
      
      // 3
      Auth.auth().signIn(with: credential) {  (_, error) in
        if let error = error {
          print(error.localizedDescription)
        } else {
        //  self.state = .signedIn
        }
      }
    }

    
    
        
        
        
    }


    
    struct Sign_inView_Previews: PreviewProvider {
        static var previews: some View {
            Sign_inView()
        }
    }
    

    
