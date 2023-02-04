import SwiftUI

struct SwipeOkashiView: View {
    var body: some View {
        VStack {
                    
//                    TopControllView()
                    
                    CardView()
                    
//                    BottomControllView()
                    
                }
                .navigationBarHidden(true) // 画面遷移後のbackボタンやtitle部分のNavigationBarを削除
    }
}


struct SwipeOkashiView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeOkashiView()
    }
}
