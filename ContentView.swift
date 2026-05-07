import SwiftUI
import DataDetection
import UserNotifications

struct ContentView: View {
    @State private var selectedDates: Set<DateComponents> = []
    @State private var selectedTime = Date()
    func requestPermission() {
        
        let WorkoutTime = selectedTime
        let WorkoutDates = selectedDates

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            guard error == nil, granted else { return }

            let timeComponents = Calendar.current.dateComponents([.hour, .minute], from: WorkoutTime)
            let hour = timeComponents.hour
            let minute = timeComponents.minute

            for day in WorkoutDates {
                var components = DateComponents()
                components.calendar = Calendar.current
                components.timeZone = TimeZone.current
                components.year = day.year
                components.month = day.month
                components.day = day.day
                components.hour = hour
                components.minute = minute

                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                let content = UNMutableNotificationContent()
                content.title = "Workout Reminder"
                content.body = "Get Moving!"
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
        }
    }
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.cyan.ignoresSafeArea()
                VStack(spacing: 16) {
                    Text("Select a Date(s) You Want To Workout On")
                        .font(.system(size: 24, weight: .bold, design: .serif))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    DatePicker ("", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                        .background(.white)
                        .frame(width: 90, height: 50)
                        .cornerRadius(15)

                    MultiDatePicker("Workout Date Selector", selection:
                        $selectedDates, in: Date()...)
                        .onChange(of: selectedDates) { newValue in
                            saveSelectedDates(newValue)
                        }
                        .background(.white)
                        .cornerRadius(15)


                    NavigationLink {
                        PRView ()
                    } label: {
                        Label("Create Workout Plan", systemImage: "square.and.arrow.down")
                            .foregroundColor(.white)
                    }
                    .bold()
                    .background(.blue)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .frame(width: 250, height: 20)
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

