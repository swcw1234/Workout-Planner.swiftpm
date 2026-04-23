import SwiftUI
 
struct PRView: View {
    @State private var assignments: [String] = []
    var body: some View {
        NavigationView {
            List(assignments, id: \.self) { item in
                Text(item)
            }
            .navigationTitle("personal records")
            .toolbar {
                NavigationLink(destination: AddAssignmentView(assignments: $assignments)) {
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

