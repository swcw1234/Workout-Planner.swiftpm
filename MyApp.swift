import SwiftUI

@main

struct MyApp: App {
    @State var workTheOut = WorkoutData()
    var body: some Scene {
        WindowGroup {
            ContentView(Dataworkout: $workTheOut)
                  }
    }
}
