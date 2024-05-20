import SwiftUI
import Foundation

@main
struct FruitApp: App {
    // @AppStorage 用於將一個屬性的值存到使用者設備上的默認設置中
    // 如在應用程式重啟後繼續保留某些設置或狀態
    // 在這裡透過 isOnboarding 來檢查是否要顯示 OnboardingView()
    // 若在其他檔案改變 isOnboarding 的值，這裡也會跟著改變
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isOnboarding {
                    OnboardingView()
                } else {
                    ContentView()
                }
            }
            .animation(.easeInOut(duration: 0.5), value: isOnboarding)
        }
    }
}
