import SwiftUI

struct TopControllView: View {
    var favoriteController: FavoriteController
    var okashiDatalist: OkashiData
    let selectedPage: PageType
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    
    var body: some View {
        
        HStack {
            
            TopNavigationButton(favoriteController: favoriteController, okashiDatalist: okashiDatalist, buttonType: .home ,selectedPage: selectedPage)
            
            TopNavigationButton(favoriteController: favoriteController, okashiDatalist: okashiDatalist, buttonType: .search ,selectedPage: selectedPage)
            
            TopNavigationButton(favoriteController: favoriteController, okashiDatalist: okashiDatalist, buttonType: .favorite ,selectedPage: selectedPage)
            
            TopNavigationButton(favoriteController: favoriteController, okashiDatalist: okashiDatalist, buttonType: .lucky ,selectedPage: selectedPage)
            
        }
        .padding()
        .frame(width: frameWidth)
    }
}

struct TopNavigationButton: View {
    var favoriteController: FavoriteController
    var okashiDatalist: OkashiData
    let buttonType: PageType
    let selectedPage: PageType
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    
    @State var isPresented: Bool = false
    
    
        
    var body: some View {
        
        Button(action: {
            // 現在のページのボタンを押されたらnavigatioを無効にしページ更新を防ぐ
            if selectedPage == buttonType {
                return
            }
            
            isPresented.toggle()
            
        }, label: {
            Image(systemName: buttonType.buttonImageName())
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                // 三項演算子を使用して色を変化
                .foregroundColor(selectedPage == buttonType ? buttonType.buttonColor() : Color.gray)
        })
        .navigationDestination(isPresented: $isPresented) {
            AppView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: buttonType)
        }
        .frame(width: frameWidth / 5)
        
    }
}
