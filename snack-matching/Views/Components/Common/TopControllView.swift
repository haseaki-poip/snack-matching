import SwiftUI

enum PageType {
    case home, search, favorite, lucky
    
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

struct TopControllView: View {
    
    let selectedPage: PageType
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    
    var body: some View {
        
        HStack {
            
            TopNavigationButton(buttonType: .home ,selectedPage: selectedPage) {
                HomeView()
            }
            
            
            TopNavigationButton(buttonType: .search ,selectedPage: selectedPage) {
                SwipeOkashiView()
            }
            
            
            TopNavigationButton(buttonType: .favorite ,selectedPage: selectedPage) {
                FavoriteView()
            }
            
            
            TopNavigationButton(buttonType: .lucky ,selectedPage: selectedPage) {
                FavoriteView()
            }

            
        }
        .padding()
        .frame(width: frameWidth)
    }
}

struct TopNavigationButton<Content: View>: View {
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    let content: Content
    let buttonType: PageType
    let selectedPage: PageType
    @State var isPresented: Bool = false
    
    init(buttonType: PageType, selectedPage: PageType, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.buttonType = buttonType
        self.selectedPage = selectedPage
    }
        
    var body: some View {
        
        Button(action: {
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
