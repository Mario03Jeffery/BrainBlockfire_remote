//
//  TimerView.swift
//  BrainBlockfire
//
//  Created by Mario Ehiagwina on 2023-07-16.
//

import SwiftUI

struct TimerView: View {
    
    @State private var timeElapsed = 0
        @State private var timer: Timer?
        @State private var isPuzzleCompleted = false
   
    var body: some View {
       
        
        VStack {
                    Text(timerText)
                        .font(.largeTitle)
                        .background(Color.blue)
                        .padding()
                    
                  /*  if !isPuzzleCompleted {
                        Button(action: {
                            startTimer()
                        }) {
                            Text("Start Timer")
                                .font(.title)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    } else {
                        Text("Puzzle Completed!")
                            .font(.title)
                            .foregroundColor(.green)
                            .padding()
                    }*/
                }
        
    }
    
    
   /* private func startTimer() {
           isPuzzleCompleted = false
           timeElapsed = 0
           timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
               timeElapsed += 1
           }
       }*/

       private func stopTimer() {
           timer?.invalidate()
           timer = nil
       }
       
       private var timerText: String {
           let minutes = timeElapsed / 60
           let seconds = timeElapsed % 60
           return String(format: "%02d:%02d", minutes, seconds)
       }
   }
        
    
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
