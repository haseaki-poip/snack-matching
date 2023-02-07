import SwiftUI

struct SwipeOkashiView: View {
    @ObservedObject var okashiDatalist = OkashiData()
    @ObservedObject var swipeController = SwipeController()
    @ObservedObject var favoriteController = FavoriteController()
    
    var body: some View {
        ZStack {
            Color("appColor")
                .ignoresSafeArea()
            
            VStack {
                
                TopControllView(selectedPage: .search)
                
                CardView(
                    okashiDatalist: okashiDatalist,
                    swipeController: swipeController,
                    favoriteController: favoriteController
                )
                
                if okashiDatalist.okashiList.first != nil {
                    
                    BottomControllView(
                        okashiDatalist: okashiDatalist,
                        swipeController: swipeController,
                        favoriteController: favoriteController
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
