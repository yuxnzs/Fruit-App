import SwiftUI

struct OnboardingView: View {
    var fruits: [Fruit] = fruitsData
    
    var body: some View {
        TabView {
            // 取得所有水果資料並打亂排序
            // 再透過 prefix(5) 取出前五個元素
            ForEach(fruits.shuffled().prefix(5)) { item in
                FruitCardView(fruit: item)
            }
        } //: TabView
        // tabViewStyle 為 TabView 配置為頁面式的滾動介面
        // 使用者可以在不同的頁面間水平滑動
        // PageTabViewStyle 為頁面式滑動 View 效果
        // indexDisplayMode: .automatic 為設定底部是否要有指示器
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .padding(.vertical, 20)
    }
}

#Preview {
    OnboardingView(fruits: fruitsData)
}
