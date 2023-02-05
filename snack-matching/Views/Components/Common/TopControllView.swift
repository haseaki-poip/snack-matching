import SwiftUI

struct TopControllView: View {
    enum SelectedItem: Int {
        case tinder, good, comment, profile
    }
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    @State var selectedItem: SelectedItem = .tinder
    
    var body: some View {
        HStack {
            Button(action: {
                
                selectedItem = .tinder
                
            }, label: {
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    // 三項演算子を使用して色を変化
                    .foregroundColor(selectedItem == .tinder ? Color.red : Color.gray)
            })
                .frame(width: frameWidth / 5)
            Button(action: {
                
                selectedItem = .good
                
            }, label: {
                Image(systemName: "suit.diamond.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .foregroundColor(selectedItem == .good ? Color.yellow: Color.gray)
            })
                .frame(width: frameWidth / 5)
            Button(action: {
                
                selectedItem = .comment
                
            }, label: {
                Image(systemName: "bubble.left.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .foregroundColor(selectedItem == .comment ? Color.green: Color.gray)
            })
                .frame(width: frameWidth / 5)
            Button(action: {
                
                selectedItem = .profile
                
            }, label: {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .foregroundColor(selectedItem == .profile ? Color.blue: Color.gray)
            })
                .frame(width: frameWidth / 5)
        }
        .padding()
        .frame(width: frameWidth)
    }
}
