//
//  loadingGraf.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-05-24.
//

import SwiftUI
import Firebase

struct loadingGraf: View {
    
    @State private var isAnimating = false
  
    
    var body: some View {
        
        VStack {
            Text("Loading...")
                .font(.title)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .scaleEffect(isAnimating ? 1.2 : 1.0)
            
            
           
            
            
            
        }
        
        
        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.573, saturation: 0.865, brightness: 0.043))
        
        
               .onAppear {
                   withAnimation(.linear(duration: 1.0)) {
                       isAnimating = true
                   }
                   

               }
        
    }
}

struct loadingGraf_Previews: PreviewProvider {
    static var previews: some View {
        loadingGraf()
    }
}
