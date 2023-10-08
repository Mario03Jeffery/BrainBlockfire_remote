//
//  BlockView.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-06-07.
//

import SwiftUI



struct BlockView: View, Identifiable {
    var dragDone: (_ blockNumber: Int, _ blockPosition: CGPoint) -> Void
    var id = UUID()
    var imageName : String
    var blockNumber : Int
   // @State var blockPosition = CGPoint()
    @State var squareSize: CGFloat = 36
    @Binding var startPoint: CGPoint
    @State  var endPoint: CGPoint =  .zero
    @State private var scale: CGFloat = 1.0
    @State private var rotationAngle: Angle = .zero
    
   
    
    var body: some View {
        
        
        
        
        let tapGesture = TapGesture(count: 1)
            .onEnded {
                withAnimation {
                    rotationAngle += .degrees(90)
                }
            }
        
        let rotationGesture = RotationGesture()
            .onChanged { value in
                rotationAngle = value
            }
        
        
        
        let dragGesture = DragGesture()
            .onChanged { value in
                
                
             endPoint = CGPoint(
                    x: startPoint .x  + value.translation.width,
                    y: startPoint .y  + value.translation.height
                )
                
                
                
               startPoint = endPoint
                
                
                
            }
            .onEnded { _ in
                
              
                dragDone(blockNumber, startPoint)
               
                
 
            }
        
        
        
        let combinedGesture = tapGesture
           .simultaneously(with: dragGesture)
            .simultaneously(with: rotationGesture)
        
        return VStack {
            
            Image(imageName)
                .rotationEffect(rotationAngle, anchor: UnitPoint(x: 0.5, y: 0.5))
                .gesture(combinedGesture)
                .scaleEffect(scale)
                .offset(x: startPoint.x,  y: startPoint.y)
             
        }
        
        
    }
    
    
    
}

struct BlockView_Previews: PreviewProvider {
    static var previews: some View {
        BlockView(dragDone: {blockNumber,blockPosition in }, imageName: "Block 1", blockNumber: 0, startPoint: .constant(.zero))
    }
}
