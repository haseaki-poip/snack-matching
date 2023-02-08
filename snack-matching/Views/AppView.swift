import SwiftUI

enum PageType {
    case home, search, favorite, lucky
    
    // buttonTypeに対して使うメソッド
    func buttonImageName() -> String {
        switch( self ){
                case .home:
                    return "house.fill"
                case .search:
                    return "eye.circle.fill"
                case .favorite:
                    return "heart.fill"
                case .lucky:
                    return "giftcard.fill"
        }
    }
    
    func buttonColor() -> Color {
        switch( self ){
                case .home:
                    return Color.yellow
                case .search:
                    return Color.blue
                case .favorite:
                    return Color.red
                case .lucky:
                    return Color.green
        }
    }
    
}

struct AppView: View {
    var favoriteController: FavoriteController
    var okashiDatalist: OkashiData
    let selectedPage: PageType
    
    var body: some View {
        NavigationStack {
            
                    
            switch( selectedPage ){
            case .home:
                    HomeView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: selectedPage)
                case .search:
                    SwipeOkashiView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: selectedPage)
                case .favorite:
                    FavoriteView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: selectedPage)
                case .lucky:
                    HomeView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: selectedPage)
            }
                    
                
            
        }
    }
}
