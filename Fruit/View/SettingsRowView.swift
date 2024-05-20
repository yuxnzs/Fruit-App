import SwiftUI

struct SettingsRowView: View {
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                
                Spacer()
                
                if let content = content {
                    Text(content)
                } else if let linkLabel = linkLabel, let linkDestination = linkDestination {
                    Link(linkLabel, destination: URL(string: "https://\(linkDestination)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundStyle(.colorBlueberryDark)
                } else {
                    // 如果都解包失敗，顯示一個空的 View
                    EmptyView()
                }
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 375, height: 60)) {
    SettingsRowView(name: "開發者", content: "Yucheng Liu")
        .padding()
}
