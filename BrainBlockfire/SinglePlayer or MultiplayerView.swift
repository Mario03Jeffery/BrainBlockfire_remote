//
//  SinglePlayer or MultiplayerView.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-06-18.
//

import SwiftUI

struct SinglePlayer_or_MultiplayerView: View {
    
    @State private var isViewsActive = false
    var colomns = [GridItem(.adaptive(minimum: 60), spacing: 20)]
    var body: some View {
      
        NavigationView{
            
            
           
            
            
            
            
            VStack{
              LazyVGrid(columns: colomns, spacing: 0){
                    
                    ForEach (blocklist, id: \.id ){ block in
                        BlockImage(blocks: block)
                        
                            .padding()
                        
                    }
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                
                
                VStack{
                    
                    
                    NavigationLink(destination: {
                        
                        Single_playerView()
                        
                            .navigationBarBackButtonHidden(true)
                         
                        
                    }, label: {
                        
                        Text("Single Player")
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .padding()
                            .border(.blue, width: 1)
                            .background(.blue)
                            .padding(.all)
                        
                           
                    })
                     
                    
                    NavigationLink(destination: {
                        
                        MultiplayerView()
                        
                    }, label: {
                        
                        Text("Multiplayer")
                            .cornerRadius(20)
                            .foregroundColor(Color.white)
                            .padding()
                            .border(.red, width: 3)
                            .background(.red)
                            .padding(.all)
                        
                        
                    })
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
            }
            
       
        
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(Color(hue: 0.573, saturation: 0.865, brightness: 0.043))
            
        }
    
    }
       
}

struct SinglePlayer_or_MultiplayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayer_or_MultiplayerView()
    }
}
