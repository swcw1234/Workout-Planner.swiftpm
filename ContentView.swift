import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var selectedDates: Set<DateComponents> = []
    @State private var selectedTime = Date()
    func requestPermission() {
        let WorkoutTime = selectedTime
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            guard error == nil, granted else { return }
            
            _ = Calendar.current.dateComponents([.hour, .minute], from: WorkoutTime)
            func scheduleWeeklyReminder(weekday: Int, hour: Int, minute: Int) {
                var components = DateComponents()
                components.calendar = Calendar.current
                components.timeZone = TimeZone.current
                components.weekday = weekday
                components.hour = hour
                components.minute = minute
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
                let content = UNMutableNotificationContent()
                content.title = "Workout Reminder"
                content.body = "Get Moving!"
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.cyan.ignoresSafeArea().background(Color.cyan.gradient)
                VStack(spacing: 16) {
                    Text("Select a Date(s) You Want To Workout On")
                        .font(.system(size: 24, weight: .bold, design: .serif))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    DatePicker ("", selection: $selectedTime, in: Date ()..., displayedComponents: [.hourAndMinute])
                        .background(.white)
                        .frame(width: 90, height: 35)
                        .cornerRadius(200)
                    
                    Image ("JSP")
                    
                        MultiDatePicker("Workout Date Selector", selection:
                                            $selectedDates, in: Date()...)
                        .onChange(of: selectedDates) { newValue in
                            saveSelectedDates(newValue)
                        }
                        .background(.white)
                        .cornerRadius(15)
                        .padding(2)
                        
                        
                        NavigationLink {
                            PRView ()
                        } label: {
                            Label("Go To PR Records", systemImage: "dumbbell.fill")
                                .foregroundColor(.white)
                        }
                        .font(.title)
                        .bold()
                        .background(.blue)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .frame(width: 300, height: 20)
                        .shadow(radius: 10)
                        .padding(10)
                        
                    Button (action: requestPermission) {
                           Label ("Request Notfication", systemImage: "bell.fill")
                        }
                    .font(.headline)
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(15)
                        .frame(width: 250, height: 20)
                        .padding(15)
                    
                    Button(action:  clearCalendarAndNotifications) {
                       Label ("Clear All Calander and Notfications ", systemImage: "trash.fill")
                    }
                    .font(.caption)
                    .frame(width: 230, height: 25)
                    .background(.red)
                    .foregroundStyle(.white)
                    .cornerRadius(15)
                    .padding(-10)
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
    
    
    private func clearCalendarAndNotifications() {
        selectedDates.removeAll()
        UserDefaults.standard.removeObject(forKey: "selectedDates")
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
