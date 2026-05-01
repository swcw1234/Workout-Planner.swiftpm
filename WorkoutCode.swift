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
            
                
           //Will Come Back Too
            
           // var dateComponents = DateComponents()
           // dateComponents.year = selectedDates.first
           // dateComponents.month = selectedDates
           // dateComponents.day = selectedDates
           // dateComponents.hour = 12
           // dateComponents.minute = 0
        }
        print("Permission granted: \(granted)")
    }
}

struct AddWorkoutView: View {
    
    @Binding var assignments: [String]
    
    @State var workout = ""
    @State var pr = ""
    @State private var selectedDate = Date()
    
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack(spacing: 16) {
                VStack {
                    
                    
                    DatePicker ("", selection: $selectedDate)
                    
                    TextField("workout", text: $workout)
                    
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    TextField("pr", text: $pr)
                    
                        .textFieldStyle(.roundedBorder)
                        .padding()
                       
                    Button("Save PR")
                        {
                        let formatter = DateFormatter()
                        formatter.dateStyle = .short
                        formatter.timeStyle = .short
                        let dateTime = formatter.string(from: selectedDate)
                        let newPR = "\(workout): \(pr) (\(dateTime))"
                        assignments.append(newPR)
                                
                        workout = ""
                        pr = ""
                        selectedDate = Date()
                    }
                    
                    Spacer()
                }
                .navigationTitle("New Personal records")
                .font(.system(size: 24, weight: .bold, design: .serif))
                .foregroundColor(.black)
                
            }
            
        }
        
    }
}
