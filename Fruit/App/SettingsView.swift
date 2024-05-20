import SwiftUI

struct SettingsView: View {
    // 從 SwiftUI 的 environment 中獲取數據
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // App 介紹
                    GroupBox(content: {
                        Divider()
                            .padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 9))
                            
                            Text("大部分的水果天然低脂、低鈉、低熱量，且不含膽固醇。水果是許多必需營養素的來源，包括鉀、膳食纖維、維生素等等")
                                .font(.footnote)
                        }
                    }, label: {
                        SettingsLabelView(labelText: "水果介紹 App", labelImage: "info.circle")
                    })
                    
                    // 回到主畫面
                    GroupBox(content: {
                        Divider()
                            .padding(.vertical, 4)
                        
                        Text("可以通過切換開關來重新回到主畫面，開啟後會再次看到主畫面")
                            .padding(.vertical, 8)
                            // 避免文字被截斷
                            // layoutPriority 用來影響 View 在父層 View 中的佈局優先級
                            // 當有多個 View 競爭有限的空間時
                            // layoutPriority 可以指定哪些 View 應該首先被考慮分配更多的空間
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, minHeight: 60, alignment: .leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("已回到主畫面")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.green)
                            } else {
                                Text("回到主畫面")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            // UIKit 顏色
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }, label: {
                        SettingsLabelView(labelText: "回到主畫面", labelImage: "homekit")
                    })
                    
                    // App 資訊
                    GroupBox(content: {
                        SettingsRowView(name: "開發者", content: "Yucheng Liu")
                        SettingsRowView(name: "設計者", content: "Yucheng Liu")
                        SettingsRowView(name: "相容性", content: "iOS 17")
                        SettingsRowView(name: "網站", linkLabel: "GitHub", linkDestination: "github.com/yuxnzs")
                        SettingsRowView(name: "版本", content: "1.0.0")
                    }, label: {
                        SettingsLabelView(labelText: "應用程式", labelImage: "apps.iphone")
                    })
                    
                } //: VStack
                .navigationBarTitle("設定", displayMode: .large)
                .padding()
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            // 關閉當前 View
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                    
                }
            } //: ScrollView
        } //: NavigationStack
    }
}

#Preview {
    SettingsView()
}
