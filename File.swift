//
//  File.swift
//  Workout Planner
//
//  Created by Sean M. Wysocki on 5/11/26.
//

import SwiftUI

struct File: View {
    @State var exercies: [String]  = ["PUSHUPS", "SQUATES","LUNGES","BENCH PRESSES","PULLUPS","CARDIO", "LATERAL RAISES", "DEADLIFTS", "HAMMER CURLS", "JUMMPING JACKS", "DUMBELL ROWS", "OVERHEAD PRESS", "BENT OVER ROWS"]
    
    @State var Edice10 = ["8","6","5","10","7","9","10","4"]
    @State var Ndice15 = ["12","14","15","15","3","16","8","17","8","9","10","11","12","13","15","14"]
    @State var Hdice35 = ["22","21","12","4","5","12","24","13","16","18","17","18","19","20","10","11","12","13","15","14","23","25","26","27,","28","29","34","31","32","35"]
    @State var VHdice1055 = ["125","150","130","151", "101","130","130","155","50","63","126","73","68","73", "100","1055" ]
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
                
                Text("Your Exercise for today is:")
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
                    Button("easy"){
                        dice = Edice10
                    }
                    Button("Normal"){
                        dice = Ndice15
                    }
                    Button("Hard"){
                        dice = Hdice35
                    }
                    Button("Very Hard"){
                        dice = VHdice1055
                    }
                } label: {
                    Text("mode")
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
                    Text(dice.randomElement()!)
                        .foregroundStyle(.white)
                        .bold()
                        .font(.largeTitle)
                }
                                }
        }
    }
}
