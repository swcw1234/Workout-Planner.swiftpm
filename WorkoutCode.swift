import SwiftUI
import UserNotifications

struct AddWorkoutView: View {
    
    @Binding var assignments: [String]
    @State var workout = ""
    @State var pr = ""
    @State var weight = ""
    @State private var selectedDate = Date()
    @State var comments: [String]  = [ "Youre Doing Great!", "Keep Up The Great Work!", "Don't Give Up Now!", "Keep Going!", "Lets Get It"
    ];    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack(spacing: 16) {
                VStack {
                    
                    Text ("New Personal Record")
                        .font(.system(size: 30, weight: .bold, design: .serif))
                        .foregroundStyle(.white)
                    
                    DatePicker ("", selection: $selectedDate)
                        .background(.white)
                        .cornerRadius(15)
                        .scaledToFit()
                        .padding(-20)
                        .frame(width: 50, height: 30)
                    
                    TextField("Workout", text: $workout)
                    
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .shadow(radius: 10)
                    
                    TextField("PR", text: $pr)
                    
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .shadow(radius: 10)
                    
                    TextField("Weight (currently)", text: $weight)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .shadow(radius: 10)
                    Button("Save PR")
                    {
                        let formatter = DateFormatter()
                        formatter.dateStyle = .short
                        formatter.timeStyle = .short
                        let dateTime = formatter.string(from: selectedDate)
                        let newPR = "💪 - \(workout) ⏱️ - \(pr)  💾 - \(weight) (🗓️ - \(dateTime))"
                        assignments.append(newPR)
                        
                        weight = ""
                        workout = ""
                        pr = ""
                        selectedDate = Date()
                    }
                    .foregroundStyle(Color.white)
                    .bold()
                    .background(.blue)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .frame(width: 250, height: 20)
                    Spacer()
                }
            }
            .font(.system(size: 24, weight: .bold, design: .serif))
            .foregroundColor(.black)
            
        }
        ZStack {
            Color.cyan.ignoresSafeArea().background(Color.cyan.gradient)
            VStack {
                Color.cyan.ignoresSafeArea()
                
                Text(comments.randomElement()!)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}
