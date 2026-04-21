import SwiftUI

struct ContentView: View {
    @State private var selectedDates: Set<DateComponents> = []
    var body: some View {
        MultiDatePicker("Workout Date Selector", selection: $selectedDates)
    }
}
