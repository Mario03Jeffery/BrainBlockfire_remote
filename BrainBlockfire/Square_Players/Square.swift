//
//  Square.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-06-02.
//

import SwiftUI

struct Square: View {
    var body: some View {
        Rectangle()
                   .foregroundColor(.white)
                   .border(Color.black, width: 1)
    }
}

struct Square_Previews: PreviewProvider {
    static var previews: some View {
        Square()
    }
}
