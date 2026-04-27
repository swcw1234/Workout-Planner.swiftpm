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

struct AddAssignmentView: View {
    
    @Binding var assignments: [String]
    
    @State var workout = ""
    @State var pr = ""
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
Text("VERY GLITHCY")
            TextField("workout", text: $workout){
            }
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextField("pr", text: $pr){
            }
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Save PR") {
                
                let newAssignment = "\(workout): \(pr)"
                assignments.append(newAssignment)

                workout = ""
                pr = ""
                UserDefaults.standard.set(assignments, forKey: "working")
            }
            
            Spacer()
        }
        .navigationTitle("New Assignment")
    }
    
}
