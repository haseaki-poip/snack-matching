import SwiftUI

struct SwipeOkashiView: View {
    var favoriteController: FavoriteController
    var okashiDatalist: OkashiData
    let selectedPage: PageType
    
    @ObservedObject var swipeController = SwipeController()
    
    var body: some View {
        ZStack {
            Color("appColor")
                .ignoresSafeArea()
            
            VStack {
                TopControllView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: selectedPage)
                
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
