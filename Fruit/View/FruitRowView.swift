import SwiftUI

struct FruitRowView: View {
    var fruit: Fruit
    
    var body: some View {
        HStack {
            Image(fruit.image)
                // .renderingMode(.original) 使圖片保持原本的顏色，不受其他 View 影響
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3),
                        radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(
                        colors: fruit.gradientColors,
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(fruit.headline)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
            } //: VStack
        } //: HStack
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FruitRowView(fruit: fruitsData[0])
        .padding()
}
