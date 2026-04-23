//
//  File.swift
//  Workout Planner
//
//  Created by Sean M. Wysocki on 4/23/26.
//

import SwiftUI

struct AddAssignmentView: View {
    
    @Binding var assignments: [String]
    
    @State private var workout = ""
    @State private var pr = ""
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            
            TextField("workout", text: $workout)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextField("pr", text: $pr)
                .textFieldStyle(.roundedBorder)
                .padding()
                .keyboardType(.numberPad)
            
            Button("Add Assignment") {
                let newAssignment = "\(workout): \(pr)"
                assignments.append(newAssignment)
                
                workout = ""
                pr = ""
            }
            
            Spacer()
        }
        .navigationTitle("New Assignment")
    }
    
}
