//
//  Single_playerView.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-06-02.
//

import SwiftUI

struct Single_playerView: View {
   
    let boardsize = (rows: 6, columns: 6)
    let boardSize = 6
    let squareSize: CGFloat = 36
    let codeArea = (startRow: 1, endRow: 4, startColumn: 2, endColumn: 5)
    let spacing: CGFloat = 1
    let blockWidth: CGFloat = 100 // Bredd på varje block
       let blockHeight: CGFloat = 100 // Höjd på varje block
    let columns = 6
    let rows = 6
    
    var blocksImg = ["Block 1", "Block 2", "Block 3", "Block 4", "Block 5", "Block 6", "Block 7", "Block 8", "Block 9" ]

    
    @State  var blockPossitions : [CGPoint] = [ .zero, .zero, .zero, .zero, .zero, .zero, .zero, .zero, .zero ]
   
    
    @State private var blocks = [BlockView]()
    @State private var generatedCode = ""
    @State private var blockPositions = [String]()
    @State private var animate = false
    @State private var isButtonVisible = true
    @State var someConditions = true
    @State private var generatedCodes = [String]()
   
   
    @State var startPoint: CGPoint = .zero
    @State  var endPoint: CGPoint =  .zero
    
    @State private var timeElapsed = 0
    @State private var timer: Timer?
  
    @State private var imageOffset: CGSize = .zero
    
   
    
    var body: some View {
        
        NavigationView {
            
            
        
        ZStack{
        
            
            VStack(spacing: 0) {
                
                
               
                // Timer format in text
                
                
                
                Text(timerText)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 100 )
                
                
                
                //Boards Display
                
                ForEach(0..<boardSize, id: \.self) { xp in
                    HStack(spacing:0) {
                        ForEach(0..<boardSize, id: \.self) { yp in
                            Square()
                                .frame(width: squareSize, height: squareSize)
                        }
                        
                    }
                    
                }
                
               
                
                
            }
            
            .padding(.top, -400.0)
            
            //Image block list
            
            
          
           
            
            
            
            //Start game with Start Game button to generate code and start timer
            
            HStack{
                
                
                // Display the codes using the generated blockPositions array
                
                if isButtonVisible {
                    Button {generateCode()} label: {
                        Text("Start Game")
                            .font(.headline)
                            .fontWeight(.bold)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.white)
                            .cornerRadius(7)
                            .padding(.horizontal, 15)
                            .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.white, lineWidth: 4))
                        
                        
                        
                       /* VStack{
                            
                            Text("Click Button to Start Game")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                              
                                .frame(height: 700, alignment: .bottom
                                       
                                )
                            
                            
                              
                        }
                        
                        VStack{
                            
                            Image(systemName: "arrow.left")
                              
                                .resizable()
                                .frame(width: 50, height: 35, alignment: .leading)
                               
                                
                               
                                

                        }*/
                        
                    }
                }
               
                
                
                
                HStack {
                    Spacer()
                    Text(" \(generatedCodes.joined(separator: ", "))")
                        .padding()
                   
                }
                
                
                
                
                
                
                
                
                
                VStack(spacing: 20) {
                    ForEach(0..<boardsize.rows, id: \.self) { rowIndex in
                        HStack(spacing: 10) {
                            ForEach(0..<boardsize.columns, id: \.self) { columnIndex in
                                
                                
                                
                                
                                let position = "\(Character(UnicodeScalar(65 + columnIndex)!))\(boardsize.rows - rowIndex)"
                                
                             
                                
                                if blockPositions.contains(position) {
                                    Text(position)
                                        .frame(width: 21, height: 17)
                                        .background(Color.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(1)
                                } else {
                                    Rectangle()
                                        .frame(width: 27, height: 17)
                                        .background(Color.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    
                                }
                            }
                        }
                    }
                }
                
                
                .padding(.top, -289)
                .padding(.leading, -300)
                
                
                
                
                .onAppear {
                    animate = false
                    isButtonVisible = true
                  
                    
                    //har med index
                
                    for (Index, block) in
                            blocksImg.enumerated()
                    {
                        
                        
                        blocks.append(BlockView  (dragDone: {blockNumber,  blockPosition in
                            
                            blockDragDone(blockNumber: blockNumber, blockPosition: blockPosition, squareSize: squareSize)}, imageName: block, blockNumber: Index, startPoint:$blockPossitions[Index]))
                        
                        
                        
                        
                        
                        
                        
                    }
                  
                   
                       
                
                }
                
               
                   
                
            }
            
            
            ZStack {
                
               
                ForEach (blocks, id: \.id ){ block in
                    block
                 
                        .frame(width: 215, height: 600, alignment: .topLeading)
                    
                    
          
                    
                    
                    
                    
                    
                }
                    
                   
                
                
                
                
            }
            
            Text("")
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(trailing:
                    NavigationLink(destination: AccountsView()) {
                        Image(systemName: "gear")
                        .foregroundColor(.white)
                    }
                )
            
            
        }
        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.573, saturation: 0.865, brightness: 0.043))
        
    }
    }
    // Game code being generated
    

    
    func blockDragDone(blockNumber: Int, blockPosition: CGPoint, squareSize: CGFloat)  {
        
        print("DragDone")
        
        print(blockNumber)
        print(blockPosition)
        blockPossitions[blockNumber] = blockPosition
        
       // var results: [CGPoint] = []
        
        for (Index,  positions) in
                blockPossitions.enumerated()
        {
            
            print(Index)
            print(blockPossitions[Index])
            
            blockPossitions[blockNumber] = blockPosition
            
           if someConditions {
               let x = round(positions.x / squareSize) * squareSize
               let y = round(positions.y / squareSize) * squareSize
          blocks[Index].startPoint = CGPoint(x: x, y: y)
               
             
           } else{
               
              // blocks[Index].startPoint = .zero
           }
          
            
           /* if Index != blockNumber {
                let dx = blockPosition.x - bp.x
                let dy = blockPosition.y - bp.y
                let distance = sqrt(dx * dx + dy * dy)
                
                let minimumDistance: CGFloat = 36
                
                if distance < minimumDistance {
                    results.append(CGPoint.zero)
                }
            }*/
            
        }
      
       
       
        
      
      
    }
    
   
    func generateCode() {
        timeElapsed = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            timeElapsed += 1
        }
        
        var codes = [
            "D3, B4, C3, C4, E3, D4",
            "A4, B5, C5, C6, F6, D6",
            "F3, D1, E2, A1, C1, D2",
            "F1, A6, F1, A6, F1, A6",
            "B1, B2, A2, A3, B3, C2",
            "A5, F2, A5, F2, B6, E1",
            "E5, E6, D5, E4, F4, F5"
        ]
        
        let randomIndex = Int.random(in: 0..<codes.count)
        generatedCode = codes[randomIndex]
        codes.remove(at: randomIndex)
        
        // Parse the code and extract the block positions
        let components = generatedCode.components(separatedBy: ",")
        blockPositions = components.map { component in
            let position = component.trimmingCharacters(in: .whitespaces)
            return String(position.suffix(2)) // Extract the last 2 characters
        }
        animate = true
        
        isButtonVisible = false
    }
    
    
    
    
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    // minutes and seconds (timeElapsed)
    private var timerText: String {
        _ = timeElapsed / 60
        _ = timeElapsed % 60
        
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"
        let formattedTime = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeElapsed)))
        
        return formattedTime
    }
    
    func imageIsOverCode(position: String) -> Bool {
        // Calculate the position of the dragged image based on offset
        let imagePosition = CGPoint(x: imageOffset.width, y: imageOffset.height)
        
        let boardSize = (rows: 6, columns: 6)
        
        let columnIndex = Int(position.prefix(1).unicodeScalars.first!.value) - 65
        let rowIndex = Int(position.suffix(1))!
        let codeCellFrame = CGRect(x: CGFloat(columnIndex * 50), y: CGFloat((boardSize.rows - rowIndex - 1) * 27), width: 27, height: 27)
        
        // Check if the image position is within the code cell's frame
        return codeCellFrame.contains(imagePosition)
    }
    
    func convertOffset(from offset: CGSize) -> CGSize {
           return offset
           // Här kan du lägga till konverteringslogik om det finns en skalning eller annan transformation mellan vyerna.
       }
    
    
}

struct Single_playerView_Previews: PreviewProvider {
    static var previews: some View {
        Single_playerView()
    }
}
