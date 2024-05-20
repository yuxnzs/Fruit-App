import SwiftUI

struct FruitNutrientsView: View {
    var fruit: Fruit
    // 用於顯示營養成分的標籤
    let nutrients: [String] = ["能量", "糖分", "脂肪", "蛋白質", "維他命", "礦物質"]
    
    var body: some View {
        // GroupBox() 創建一個有邊框、背景和標題（可選）的分組區塊
        GroupBox() {
            DisclosureGroup("每 100 克營養成分") {
                ForEach(0 ..< nutrients.count, id: \.self) { item in
                     Spacer()
                         .frame(height: 10)
                    
                    // 以 Divider() 分隔每個營養成分
                    Divider()
                        .padding(.vertical, 2)
                    
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundStyle(fruit.gradientColors[1])
                        .font(.headline)
                        
                        // 確保在小 iPhone，標籤與內容不會靠太近
                        Spacer(minLength: 25)
                        
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    } //: HStack
                }
            } //: DisclosureGroup
        } //: GroupBox
    }
}

#Preview(traits: .fixedLayout(width: 375, height: 480)) {
    FruitNutrientsView(fruit: fruitsData[0])
        .preferredColorScheme(.dark)
        .padding()
}
