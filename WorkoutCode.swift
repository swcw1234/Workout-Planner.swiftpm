import SwiftUI
import UserNotifications

struct AddWorkoutView: View {
    
    @Binding var assignments: [String]
    @State var workout = ""
    @State var pr = ""
    @State var weight = ""
    @State private var selectedDate = Date()
    
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack(spacing: 16) {
                VStack {
                    DatePicker ("", selection: $selectedDate)
                    
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
                    
                    //Gonna Come Back To This
                    
                  //  func imagePicker(_: UIImagePickerController, `var` newImage: UIImage) {
                      //  if let possibleImage = info[.editedImage] as? UIImage {
                      //      newImage = possibleImage
                      //  } else if let possibleImage = info[.originalImage] as? UIImage {
                       //     newImage = possibleImage
                     //   } else {
                       // }
                  //  }
                    }
                }
                .navigationTitle("New Personal Record")
                .font(.system(size: 24, weight: .bold, design: .serif))
                .foregroundColor(.black)
                
            }
        }
        
    }

