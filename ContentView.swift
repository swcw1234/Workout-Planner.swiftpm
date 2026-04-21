import SwiftUI

struct ContentView: View {
    @State private var selectedDates: Set<DateComponents> = []
    var body: some View {
        Text ("Select a Date(s) You Want To Workout On")
            .font(.largeTitle)
            .fontWeight(.bold)
        MultiDatePicker("Workout Date Selector", selection: $selectedDates)
        
        
    }
}
