//
//  Tabs.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-06-18.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
       
       
            TabView{
                AccountsView()
    
                    .tabItem {
                        Label("Account", systemImage: "person.circle")
                        
                            
                        
                    }
                
                    .frame(alignment: .topLeading)
           
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
