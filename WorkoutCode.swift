//
//  File.swift
//  Workout Planner
//
//  Created by Sean M. Wysocki on 4/23/26.
//

import SwiftUI
import UserNotifications

func requestPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if let error = error {
            print("Notification permission error: \(error)")
        }
        print("Permission granted: \(granted)")
    }
}

struct AddWorkoutView: View {
    
    @Binding var assignments: [String]
    @Binding var myWorkout: WorkoutData
//    @State var workout = ""
//    @State var pr = ""
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {

            TextField("workout", text: $myWorkout.workout){
            }
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextField("pr", text: $myWorkout.pr){
            }
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Save PR") {
                
                let newPR = "\($myWorkout.workout): \($myWorkout.pr)"
                assignments.append(newPR)

                myWorkout.workout = ""
                myWorkout.pr = ""
                UserDefaults.standard.set(assignments, forKey: "working")
            }
            
            Spacer()
        }
        .navigationTitle("New Personal records")
        .font(.system(size: 24, weight: .bold, design: .serif))
    }
    
}
