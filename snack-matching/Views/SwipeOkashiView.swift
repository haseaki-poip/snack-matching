import SwiftUI

struct SwipeOkashiView: View {
    @ObservedObject var okashiDatalist = OkashiData()
    @ObservedObject var swipeController = SwipeController()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("appColor")
                    .ignoresSafeArea()
                
                VStack {
                    
                    TopControllView()
                    
                    CardView(
                        okashiDatalist: okashiDatalist, swipeController: swipeController
                    )
                    
                    BottomControllView(
                        okashiDatalist: okashiDatalist, swipeController: swipeController
                    )
                    
                }
                
            }
        }
        .navigationBarHidden(true) // 画面遷移後のbackボタンやtitle部分のNavigationBarを削除
    }
}


struct SwipeOkashiView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeOkashiView()
    }
}
