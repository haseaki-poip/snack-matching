import SwiftUI

enum PageType {
    case home, swipe, favorite, voting
    
    // buttonTypeに対して使うメソッド
    func buttonImageName() -> String {
        switch( self ){
                case .home:
                    return "house.fill"
                case .swipe:
                    return "eye.circle.fill"
                case .favorite:
                    return "heart.fill"
                case .voting:
                    return "giftcard.fill"
        }
    }
    
    func buttonColor() -> Color {
        switch( self ){
                case .home:
                    return Color.yellow
                case .swipe:
                    return Color.blue
                case .favorite:
                    return Color.red
                case .voting:
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
                    HomeView(favoriteController: favoriteController, okashiDatalist: okashiDatalist)
                case .swipe:
                    SwipeOkashiView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: selectedPage)
                case .favorite:
                    FavoriteView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: selectedPage)
                case .voting:
                    HomeView(favoriteController: favoriteController, okashiDatalist: okashiDatalist)
            }
                    
                
            
        }
    }
}
