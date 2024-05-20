import SwiftUI

struct FruitHeaderView: View {
    var fruit: Fruit
    
    @State private var isAnimatingImage: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: fruit.gradientColors,
                startPoint: .top,
                endPoint: .bottom
            )
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                // 一開始載入是 false 為 0.6 倍
                // 載入後觸發 ZStack 下方的 .onAppear -> isAnimating = true
                // scaleEffect 會將圖片放大至 1.0 倍，做成動畫效果
                .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
            
        } //: ZStack
        .frame(height: 440)
        .onAppear() {
            withAnimation(.easeOut(duration: 0.5)) {
                // 當圖片載入時，啟動動畫
                isAnimatingImage = true
            }
        }
    }
}

#Preview {
    FruitHeaderView(fruit: fruitsData[0])
}
