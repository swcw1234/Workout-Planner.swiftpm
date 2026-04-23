import SwiftUI
import DataDetection

struct ContentView: View {
    @State private var selectedDates: Set<DateComponents> = []
    var body: some View {
        VStack {
            Text ("Select a Date(s) You Want To Workout On")
                .font(.largeTitle)
                .fontWeight(.bold)
            MultiDatePicker("Workout Date Selector", selection: $selectedDates, in: Date()...)
        }
        
        
        NavigationStack{
            
            Image(systemName:"square.and.arrow.down")
                .resizable()
                .frame(width: 100, height: 100)
            NavigationLink("Create Workout Plan", destination: PRView())
                .font(.largeTitle)
        }
       
        
    }
}

