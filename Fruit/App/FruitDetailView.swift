import SwiftUI

struct FruitDetailView: View {
    var fruit: Fruit
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                // 標頭
                FruitHeaderView(fruit: fruit)
                
                VStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .leading, spacing: 20) {
                        // 名稱
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(fruit.gradientColors[1])
                        
                        // 標題
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // 營養成分
                        FruitNutrientsView(fruit: fruit)
                        
                        // 副標題
                        Text("了解更多關於\(fruit.title)的資訊")
                            .fontWeight(.bold)
                            .foregroundStyle(fruit.gradientColors[1])
                        
                        // 介紹
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        // 連結
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                        
                    } //: VStack
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                } //: VStack
                .navigationBarTitle(fruit.title, displayMode: .inline)
                .navigationBarHidden(true)
            } //: ScrollView
            .ignoresSafeArea(edges: .top)
        } //: NavigationStack
        // 針對 iPad 大螢幕調整
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    FruitDetailView(fruit: fruitsData[0])
}
