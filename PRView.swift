import SwiftUI

struct PRView: View {
    @State private var assignments: [String] = []
    private let assignmentsKey = "PRAssignments"

    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack(spacing: 16) {
                NavigationView {
                    List {
                        ForEach(assignments, id: \.self) { item in
                            Text(item)
                                .foregroundColor(.black)
                        }
                        .onDelete { indexSet in
                            assignments.remove(atOffsets: indexSet)
                        }
                    }
                    .foregroundColor(.black)
                    .navigationTitle("Personal Records")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: AddWorkoutView(assignments: $assignments)) {
                                Label("Personal Record", systemImage: "plus")
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            if let data = UserDefaults.standard.data(forKey: assignmentsKey),
               let saved = try? JSONDecoder().decode([String].self, from: data) {
                assignments = saved
            }
        }
        .onChange(of: assignments) { newValue in
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: assignmentsKey)
        }
    }
}
