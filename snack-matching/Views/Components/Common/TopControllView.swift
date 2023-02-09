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
            
            TopNavigationButton(buttonType: .swipe ,selectedPage: selectedPage) {
                SwipeOkashiView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: .swipe)
            }
            
            
            TopNavigationButton(buttonType: .favorite ,selectedPage: selectedPage) {
                FavoriteView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: .favorite)
            }
            
            
            TopNavigationButton(buttonType: .voting ,selectedPage: selectedPage) {
                Text("投票結果")
            }
            
        }
        .padding()
        .frame(width: frameWidth)
    }
}

struct TopNavigationButton<Content: View>: View {
    
    let content: Content
    let buttonType: PageType
    let selectedPage: PageType
    @State var isPresented: Bool = false
    
    init(buttonType: PageType, selectedPage: PageType, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.buttonType = buttonType
        self.selectedPage = selectedPage
    }
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    
        
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
            content
        }
        .frame(width: frameWidth / 5)
        
    }
}
