//
//  HomeView.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-05-24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("Image1")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 500)
                Text("BRAIN BLOCK")
                    .font(.system(size: 56))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
            }
            
            
           
    
            
            .frame(alignment:.center)
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.573, saturation: 0.865, brightness: 0.043))
        
            .toolbar{
                
                NavigationLink(destination: {
                    
                   Sign_inView()
                    
                }, label: {
                    
                    Text("Sign in")
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .padding()
                        .border(.blue, width: 1)
                        .background(.blue)
                        .padding(.all)
                    
                    
                })
                
                
                
            }
            
          
           
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
