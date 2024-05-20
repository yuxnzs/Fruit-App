import SwiftUI

struct FruitCardView: View {
    var fruit: Fruit
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Image
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(
                        color:
                            Color(red: 0, green: 0, blue: 0, opacity: 0.15),
                        radius: 8, x: 6, y: 8
                    )
                    // 一開始載入是 false 為 0.6 倍
                    // 載入後觸發 ZStack 下方的 .onAppear -> isAnimating = true
                    // scaleEffect 會將圖片放大至 1.0 倍，做成動畫效果
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                // Title
                Text(fruit.title)
                    .foregroundColor(.white)
                    .font(.system(size: 45))
                    .fontWeight(.heavy)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.15),
                        radius: 2, x: 2, y: 2
                    )
                
                // Headline
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                // Button
                StartButtonView()
            } //: VStack
        } //: ZStack
        // .onAppear -> 當 View 出現在螢幕上時執行一些操作
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(
            LinearGradient(
                colors: fruit.gradientColors,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 20)
        
    }
}

#Preview {
    FruitCardView(fruit: fruitsData[1])
    
}
