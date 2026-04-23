import SwiftUI
import DataDetection

struct ContentView: View {
    @State private var selectedDates: Set<DateComponents> = []
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Select a Date(s) You Want To Workout On")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                MultiDatePicker("Workout Date Selector", selection: $selectedDates, in: Date()...)

                NavigationLink {
PRView ()
                } label: {
                    Label("Create Workout Plan", systemImage: "square.and.arrow.down")
                }
            }
            .padding()
        }
    }
}
