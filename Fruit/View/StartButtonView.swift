import SwiftUI

struct StartButtonView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        Button {
           isOnboarding = false
        } label: {
            HStack(spacing: 8) {
                Text("探索更多")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            // Capsule() 膠囊形狀
            // strokeBorder 為僅保留一個形狀的邊框
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
        } //: Button
        // accentColor 會影響 Button 內的所有元素
        // 而 foregroundStyle 只會影響特定 View
        .accentColor(.white)
        
    }
}

#Preview {
    StartButtonView()
        .previewLayout(.sizeThatFits)
}
