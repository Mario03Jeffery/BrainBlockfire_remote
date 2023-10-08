//
//  TTTTT.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-07-19.
//

import SwiftUI

struct TTTTT: View {
    @State private var generatedCode = ""
    @State private var blockPositions = [String]()
    @State private var showBlocks = false
    let boardSize = (rows: 5, columns: 7) // Customize your board size here
    
    var body: some View {
        VStack {
            Button(action: generateCode) {
                Text("Generate Code")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Text(generatedCode)
                .padding()
            
            VStack(spacing: 0) {
                ForEach(0..<boardSize.rows, id: \.self) { rowIndex in
                    HStack(spacing: 0) {
                        ForEach(0..<boardSize.columns, id: \.self) { columnIndex in
                            let position = "\(Character(UnicodeScalar(65 + columnIndex)!))\(boardSize.rows - rowIndex)"
                            if blockPositions.contains(position) {
                                let index = blockPositions.firstIndex(of: position)!
                                Text(position)
                                                                   .frame(width: 50, height: 50)
                                                                   .background(Color.gray)
                                                                   .foregroundColor(.white)
                                                                   .cornerRadius(10)
                                                                   .offset(y: showBlocks ? CGFloat(index) * 60 : 0) // Custom offset based on index
                                                                   .animation(.easeInOut(duration: 0.5).delay(Double(index) * 0.1)) // Animation with delay
                            } else {
                                Rectangle()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.clear)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Set maximum frame size to occupy the available space
        .background(Color.white) // Set background color to avoid overlapping with other elements
        .onAppear {
            generateCode()
        }
    }
    
    
    func generateCode() {
        let codes = [
            "Tärning 1: D3, B4, C3, C4, E3, D4",
            "Tärning 2: A4, B5, C5, C6, F6, D6",
            "Tärning 3: F3, D1, E2, A1, C1, D2",
            "Tärning 4: F1, A6, F1, A6, F1, A6",
            "Tärning 5: B1, B2, A2, A3, B3, C2",
            "Tärning 6: A5, F2, A5, F2, B6, E1",
            "Tärning 7: E5, E6, D5, E4, F4, F5"
        ]
        
        let randomIndex = Int.random(in: 0..<codes.count)
        generatedCode = codes[randomIndex]
        
        let components = generatedCode.components(separatedBy: ",")
        blockPositions = components.map { component in
            let position = component.trimmingCharacters(in: .whitespaces)
            return String(position.suffix(2))
        }
        
        showBlocks = true
    }
    
    
}

struct TTTTT_Previews: PreviewProvider {
    static var previews: some View {
        TTTTT()
    }
}
