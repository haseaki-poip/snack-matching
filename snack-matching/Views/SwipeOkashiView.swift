import SwiftUI

struct SwipeOkashiView: View {
    @ObservedObject var okashiDatalist = OkashiData()
    @ObservedObject var swipeController = SwipeController()
    @ObservedObject var favoriteController = FavoriteController()

    
    @State var isDetail = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("appColor")
                    .ignoresSafeArea()
                
                VStack {
                    
                    TopControllView()
                    
                    CardView(
                        okashiDatalist: okashiDatalist,
                        swipeController: swipeController,
                        favoriteController: favoriteController
                    )
                    
                    BottomControllView(
                        okashiDatalist: okashiDatalist,
                        swipeController: swipeController,
                        favoriteController: favoriteController,
                        isDetail: $isDetail
                    )
                    
                }
                
                if okashiDatalist.okashiList.first != nil,
                   isDetail
                {
                    DetailView(okashiItem: okashiDatalist.okashiList.first!,
                               isDetail: $isDetail
                    )
                    .transition(.move(edge: .bottom))
                        
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
