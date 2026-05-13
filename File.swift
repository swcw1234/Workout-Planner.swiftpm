//
//  File.swift
//  Workout Planner
//
//  Created by Sean M. Wysocki on 5/11/26.
//

import SwiftUI

struct File: View {
    @State var exercies: [String]  = ["PUSHUPS", "SQUATES","LUNGES","BENCH PRESSES","PULLUPS","CARDIO", "LATERAL RAISES", "DEADLIFTS", "HAMMER CURLS", "JUMMPING JACKS", "DUMBELL ROWS", "OVERHEAD PRESS", "BENT OVER ROWS"]
    
    @State var dice6 = [1,2,3,4,5,6]
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack {
                Button("New Exercise"){
                    exercies = exercies.shuffled()
                }
                .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                    .background(.blue)
                    .cornerRadius(15)
                    .scaledToFit()
                
                Text("Your Exercise for today is:")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(10)
                    .font(.headline)
                
                
                Text(exercies.randomElement()!)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.largeTitle)
                
            }
        }
    }
}
