import SwiftUI

struct BottomControllView: View {
    @ObservedObject var okashiDatalist: OkashiData
    @ObservedObject var swipeController: SwipeController
    @ObservedObject var favoriteController: FavoriteController
    
    @State var isDetail = false
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    var body: some View {
        HStack {
            
            BottomButtonView(okashiDatalist: okashiDatalist,
                             swipeController: swipeController,
                             favoriteController: favoriteController,
                             controllType: .dislike
                            )
            
            ZStack {
                
                Color(UIColor.gray)
                    .asRoundShadow(size: 50)
                
                Button(action: {
                    isDetail.toggle()
                }, label: {
                    Image(systemName: "questionmark")
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: 15,
                            height: 15
                        )
                        .foregroundColor(Color(UIColor.white))
                })
                .sheet(isPresented: $isDetail, content: {
                    
                    DetailView(okashiItem: okashiDatalist.okashiList[0])
                        
                })
                
            }
            .frame(width: frameWidth / 4)
            
            
            BottomButtonView(okashiDatalist: okashiDatalist,
                             swipeController: swipeController,
                             favoriteController: favoriteController,
                             controllType: .like
                            )
                   
        }
        .padding()
        .frame(width: frameWidth)
    }
}

struct BottomButtonView: View {
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    enum ControllType: Int {
        case like, dislike
        
        func imageName() -> String {
                switch( self ){
                        case .like:
                            return "heart"
                        case .dislike:
                            return "xmark"
                }
        }
    }
    
    var okashiDatalist: OkashiData
    var swipeController: SwipeController
    var favoriteController: FavoriteController
    let controllType: ControllType
    
    
    var body: some View {
        ZStack {
            
            Color(UIColor.white)
                .asRoundShadow(size: 65)
            
            
            Button(action: {
                
                if controllType == .like {
                    swipeController.finishSwipe(startLocation: CGPoint(x: 0, y: 0), location: CGPoint(x: 151, y: 0), okashiDatalist: okashiDatalist, favoriteController: favoriteController)
                }
                else {
                    swipeController.finishSwipe(startLocation: CGPoint(x: 0, y: 0), location: CGPoint(x: -151, y: 0), okashiDatalist: okashiDatalist, favoriteController: favoriteController)
                }
                
                
            }, label: {
                Image(systemName: controllType.imageName())
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: 30,
                        height: 30
                    )
                    .foregroundColor(Color(UIColor.systemPink))

            })
                
        }
        .frame(width: frameWidth / 4)
    }
}

// modifireの共通化
struct BackgroundModifire: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
            .cornerRadius(50)
            .shadow(radius: 10)
    }
}

extension View {
    func asRoundShadow(size: CGFloat) -> some View {
        modifier(BackgroundModifire(size: size))
    }
}
