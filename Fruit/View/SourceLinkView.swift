import SwiftUI

struct SourceLinkView: View {
    
    var body: some View {
        // GroupBox() 創建一個有邊框、背景和標題（可選）的分組區塊
        GroupBox() {
            HStack {
                Text("資料來源")
                Spacer()
                Link("維基百科", destination: URL(string: "https://wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
            } //: HStack
            .font(.footnote)
        } //: GroupBox()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SourceLinkView()
        .padding()
}
