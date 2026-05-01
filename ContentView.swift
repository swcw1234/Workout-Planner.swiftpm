import SwiftUI
import DataDetection

struct ContentView: View {
    @State private var selectedDates: Set<DateComponents> = []
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.cyan.ignoresSafeArea()
                VStack(spacing: 16) {
                    Text("Select a Date(s) You Want To Workout On")
                        .font(.system(size: 24, weight: .bold, design: .serif))
                        .fontWeight(.bold)

                    MultiDatePicker("Workout Date Selector", selection:
                                        $selectedDates, in: Date()...)
                        .onChange(of: selectedDates) { newValue in
                            saveSelectedDates(newValue)
                        }

                    NavigationLink {
                        PRView ()
                    } label: {
                        Label("Create Workout Plan", systemImage: "square.and.arrow.down")
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .onAppear {
            if let data = UserDefaults.standard.data(forKey: "selectedDates"),
               let decoded = try? JSONDecoder().decode([DateComponents].self, from: data) {
                selectedDates = Set(decoded)
            }
        }
    }
    
    private func saveSelectedDates(_ set: Set<DateComponents>) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(Array(set)) {
            UserDefaults.standard.set(data, forKey: "selectedDates")
               
        }
    }
}
