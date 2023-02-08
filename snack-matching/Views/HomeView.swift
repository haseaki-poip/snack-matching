import SwiftUI

struct HomeView: View {
    
    @ObservedObject var favoriteController = FavoriteController()
    
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
                        
                        HomeNavigationButton {
                            SwipeOkashiView(favoriteController: favoriteController)
                        } label: {
                                Text("お菓子を探す")
                        }
                        
                        HomeNavigationButton {
                            Text("今日のラッキーお菓子")
                        } label: {
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

struct HomeNavigationButton<Content: View, Label: View>: View {
    
    let content: Content
    let label: Label
    
    @State var isPresented: Bool = false
    
    init(@ViewBuilder content: () -> Content, @ViewBuilder label: () -> Label) {
        self.content = content()
        self.label = label()
    }
        
    var body: some View {
        
        Button(action: {
            isPresented.toggle()
        }, label: {
            label
                .frame(width: 150)
                .padding()
                .background(Color.brown)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        })
        
        .navigationDestination(isPresented: $isPresented) {
            content
        }
        .frame(height: 80)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
