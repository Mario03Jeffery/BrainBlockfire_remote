//
//  Blocks.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-06-07.
//

import Foundation
struct block: Identifiable {
    var id = UUID()
    var image : String
    
}
var blocklist = [block(image: "Block 1"),
                 block(image: "Block 2"),
                 block(image: "Block 3"),
                 block(image: "Block 4"),
                 block(image: "Block 5"),
                 block(image: "Block 6"),
                 block(image: "Block 7"),
                 block(image: "Block 8"),
                 block(image: "Block 9")]
