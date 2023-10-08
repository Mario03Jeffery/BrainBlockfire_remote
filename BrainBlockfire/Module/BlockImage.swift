//
//  BlockImage.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-06-18.
//

import SwiftUI

struct BlockImage: View {
    
    var blocks : block
    
    var body: some View {
        Image(blocks.image)
    }
}

struct BlockImage_Previews: PreviewProvider {
    static var previews: some View {
        BlockImage(blocks: blocklist[1])
    }
}
