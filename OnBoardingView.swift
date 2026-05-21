import SwiftUI

struct OnBoardingView: View {
    @State private var showMain = false
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    TabView {
                        OnBoardingPage(title: "Welcome To Workout Planner", subtitle: "Plan and track your workouts", image: "dumbbell")
                            .foregroundStyle(.black)
                            .bold()
                        
                        OnBoardingPage(title: "Plan Your Routine", subtitle: "Set Notfications For When You Want To Workout", image: "bell")
                            .foregroundStyle(.black)
                            .bold()
                        
                        OnBoardingPage(title: "Stay Motivated", subtitle: "Set New PRs", image: "chart.line.uptrend.xyaxis")
                            .foregroundStyle(.black)
                            .bold()
                        
                        }
                    Button("Let's Go!") {
                        hasSeenOnboarding = true
                        showMain = true
                    }
                    .background(.blue)
                    .cornerRadius(15)
                }
                .tabViewStyle(.page)
                .buttonStyle(.bordered)
                .foregroundStyle(.white)
                .cornerRadius(15)
                .padding(-5)
                
            }
            .navigationBarBackButtonHidden(true)
        }
        .fullScreenCover(isPresented: $showMain) {
            ContentView()
                .interactiveDismissDisabled(true)
        }
    }
}

#Preview {
    OnBoardingView()
}

struct OnBoardingPage: View {
    let title: String
    let subtitle: String
    let image: String
    @State private var appearCount = 0
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.thinMaterial)
                .overlay(
                    VStack(spacing: 12) {
                        Image(systemName: image)
                            .font(.system(size: 48, weight: .semibold))
                        Text(title)
                            .font(.title).bold()
                        Text(subtitle)
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                )
        }
        .scaledToFill()
        .background(Color.blue.gradient)
    }
}

#Preview {
    OnBoardingPage(title: "Title", subtitle: "Subtitle", image: "dumbbell")
}
