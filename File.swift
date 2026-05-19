//
//  File.swift
//  Workout Planner
//
//  Created by Sean M. Wysocki on 5/11/26.
//

import SwiftUI

struct File: View {
    @State var exercies: [String]  = ["PUSHUPS", "SQUATES","LUNGES","BENCH PRESSES","PULLUPS", "LATERAL RAISES", "DEADLIFTS", "HAMMER CURLS", "JUMMPING JACKS", "DUMBELL ROWS", "OVERHEAD PRESS", "BENT OVER ROWS"]
    
    @State var Ndice17 = ["8","16","15","10","7","9","10","14","12","14","15","15","13","16","8","17","8","9","10","11","12","13","15","14"]
    @State var Hdice35 = ["22","21","12","24","35","12","24","13","16","18","17","18","19","20","10","11","12","13","15","14","23","25","26","27","28","29","34","31","32","35"]
    @State var VHdice155 = ["125","150","130","151","89", "101","130","130","155","50","63","126","73","69","73", "100","234","109","210","87","52","69","67","68","54","69","69","105","149","123","87"]
    @State var dice = [""]

    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea().background(Color.cyan.gradient);            VStack {
                Button("Roll Exercise"){
                    exercies = exercies.shuffled()
                }
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .background(.blue)
                .cornerRadius(15)
                .scaledToFit()
                
                Text("Your Exercise For Today Is:")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(10)
                    .font(.headline)
                
                
                Text(exercies.randomElement()!)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.largeTitle)
                Spacer()
            }
            VStack{
                Menu {
                    Button("Easy"){
                        dice = Ndice17
                    }
                   
                    Button("Normal"){
                        dice = Hdice35
                    }
                    Button("Hard"){
                        dice = VHdice155
                    }
                } label: {
                    Text("Mode")
                }
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .background(.blue)
                .cornerRadius(15)
                .scaledToFit()
                
                
                .font(.headline)
                
                if dice != [""]{
                    Button("Sets"){
                        dice.shuffle()
                    }
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                    .bold()
                    .background(.white)
                    .cornerRadius(15)
                    .scaledToFit()
                    .offset(x: 0, y: 100)
                    Text(dice.randomElement()!)
                        .foregroundStyle(.white)
                        .bold()
                        .font(.largeTitle)
                        
                }
                                }
           

                }
                      
            }
            
        }



