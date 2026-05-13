//
//  File.swift
//  Workout Planner
//
//  Created by Sean M. Wysocki on 5/11/26.
//

import SwiftUI

struct File: View {
    @State var exercies: [String]  = ["PUSHUPS", "SQUATES","LUNGES","BENCH PRESSES","PULLUPS","CARDIO", "LATERAL RAISES", "DEADLIFTS", "HAMMER CURLS", "JUMMPING JACKS", "DUMBELL ROWS", "OVERHEAD PRESS", "BENT OVER ROWS"]
    
    @State var Edice8 = ["8","5","6","5","6","8","7"]
    @State var Ndice15 = ["12","14","15","15","3","16","8","17","8","9","10","11","12","13","15","14"]
    @State var Hdice35 = ["22","21","12","4","5","12","24","13","16","18","17","18","19","20","10","11","12","13","15","14","23","25","26","27,","28","29","34","31","32","35"]
    @State var VHdice1055 = ["125","150","130","151", "101","130","130","155","50, 63","126","73","68","73", "100","1055" ]
    
    
    @State var dice6 = [1,2,3,4,5,6]
    @State var dice = [""]
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack {
                Button("Roll Exercise"){
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
            VStack{
//                Button("easy"){
//                   dice = Edice8
//                }
//                .font(.headline)
                
                Button("Sets"){
                    Edice8.shuffle()
                }
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .background(.blue)
                .cornerRadius(15)
                .scaledToFit()
                Text(Edice8.randomElement()!)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.largeTitle)
            }
            .offset(y: 150)
        }
    }
}
