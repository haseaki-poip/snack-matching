import SwiftUI

struct HomeView: View {
    var favoriteController: FavoriteController
    var okashiDatalist: OkashiData
    let selectedPage: PageType
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appColor")
                    .ignoresSafeArea()
                
                VStack {
                    Text("いとお菓子")
                        .foregroundColor(Color.brown)
                        .font(Font.system(size: 45).bold())
                        .padding(.bottom, 0.1)
                    
                    Text("お菓子なマッチングアプリ")
                        .foregroundColor(Color.brown)
                        .font(Font.system(size: 15))
                    
                    VStack {
                        HStack {
                            Image("chips")
                                .asHomeImage(size: 150)
                            Image("chocolate")
                                .asHomeImage(size: 150)
                        }
                
                        Image("cookie")
                            .asHomeImage(size: 150)
                    }
                    .padding()
                    
                    VStack {
                        
                        HomeNavigationButton(favoriteController: favoriteController, okashiDatalist: okashiDatalist, nextPage: .search) {
                            Text("お菓子を探す")
                        }
                        
                        HomeNavigationButton(favoriteController: favoriteController, okashiDatalist: okashiDatalist, nextPage: .favorite) {
                            Text("今日のお菓子")
                        }
                        
                    }
                }
            }
        }
        .navigationBarHidden(true)
        
    }
}

extension Image {
    func asHomeImage(size: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: size, height: size)
    }
}

struct HomeNavigationButton<Content: View>: View {
    var favoriteController: FavoriteController
    var okashiDatalist: OkashiData
    let nextPage: PageType
    let content: Content
    
    
    @State var isPresented: Bool = false
    
    init(favoriteController: FavoriteController, okashiDatalist: OkashiData, nextPage: PageType, @ViewBuilder content: () -> Content) {
        self.favoriteController = favoriteController
        self.okashiDatalist = okashiDatalist
        self.nextPage = nextPage
        self.content = content()
    }
        
    var body: some View {
        
        Button(action: {
            isPresented.toggle()
        }, label: {
            content
                .frame(width: 150)
                .padding()
                .background(Color.brown)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        })
        
        .navigationDestination(isPresented: $isPresented) {
            
            if nextPage == .search {
                SwipeOkashiView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: nextPage)
            }
            else {
                FavoriteView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: nextPage)
            }
            
        }
        .frame(height: 80)
        
    }
}
