//
//  File 2.swift
//  Workout Planner
//
//  Created by Paul V. Suarez Kwan on 4/27/26.
//

//1
import SwiftUI
class WorkoutData: ObservableObject {
    @Published var workout = ""
    @Published var pr = ""
    
    init(workout: String = "", pr: String = "") {
        self.workout = workout
        self.pr = pr
    }
    
}
