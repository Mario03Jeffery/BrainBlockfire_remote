//
//  AccountsView.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-06-18.
//

import SwiftUI
import Firebase


struct AccountsView: View {
    var body: some View {
        VStack{
            
            Image("Image1")
                .resizable()
                .scaledToFit()
            
            
            Button(action: {
                try! Auth.auth().signOut()
            }, label: {
                Text ("Log out")
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .padding()
                    .border(.blue, width: 1)
                    .background(.blue)
                    .padding(.all)
            })
            
            
            
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.573, saturation: 0.865, brightness: 0.043))
    }
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView()
    }
}
