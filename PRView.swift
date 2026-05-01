import SwiftUI
 
struct PRView: View {
    @State private var assignments: [String] = []
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack(spacing: 16) {
               
                Button("Request Notfication Acesses") {
                    requestPermission()
                       
                        
                    
                }
                .foregroundColor(.black)
                NavigationView {
                    List(assignments, id: \.self) { item in
                         Text(item)
                            .foregroundColor(.black)
                        Button("remove"){
                            
                            assignments.remove(atOffsets: .init(integer: assignments.firstIndex(of: item)! ))
                                
                               
                        }
                        
                    }
                    .foregroundColor(.black)
                    .navigationTitle("Personal Records")
                    .toolbar {
                        NavigationLink(destination: AddWorkoutView(assignments: $assignments)) {
                            Image(systemName: "plus")
                            Text ("Personal Record")
                            Spacer()
                                .font(.largeTitle)
                                .bold()
                                Color.gray.ignoresSafeArea()
                                VStack(spacing: 16) {
                                    
                                }
                            }
                        }
                    
                    }
                }
                
            }
        }
    }

