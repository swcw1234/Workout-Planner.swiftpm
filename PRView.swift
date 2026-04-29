import SwiftUI
 
struct PRView: View {
    @State private var assignments: [String] = []
    @Binding var Theworkdata: WorkoutData
    var body: some View {
        
        Button("Request Notfication Acesses") {
            requestPermission()
               
        }
        
        NavigationView {
            List(assignments, id: \.self) { item in
                Text(item)
            }
            .navigationTitle("Personal Records")
            .toolbar {
                NavigationLink(destination: AddWorkoutView(assignments: $assignments, myWorkout: $Theworkdata)) {
                    Image(systemName: "plus")
                    Text ("Personal Record")
                    Spacer()
                        .font(.largeTitle)
                        .bold()
                    
                }
            }
        }
    }
}

