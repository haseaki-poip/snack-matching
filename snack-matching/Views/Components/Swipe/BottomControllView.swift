import SwiftUI

struct BottomControllView: View {
    @ObservedObject var okashiDatalist: OkashiData
    @ObservedObject var swipeController: SwipeController
    @ObservedObject var favoriteController: FavoriteController
    
    @Binding var isDetail : Bool
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    var body: some View {
        HStack {
            
            BottomButtonView(okashiDatalist: okashiDatalist,
                             swipeController: swipeController,
                             favoriteController: favoriteController,
                             controllType: .dislike,
                             isDetail: $isDetail)
            
//            BottomButtonView(okashiDatalist: okashiDatalist,
//                             swipeController: swipeController,
//                             favoriteController: favoriteController,
//                             controllType: .detail,
//                             isDetail: $isDetail)
            
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
                    DetailView(okashiItem: okashiDatalist.okashiList[0], isDetail: $isDetail)
                })
            }
            
            
            BottomButtonView(okashiDatalist: okashiDatalist,
                             swipeController: swipeController,
                             favoriteController: favoriteController,
                             controllType: .like,
                             isDetail: $isDetail)
                   
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
        case like, dislike, detail
        
        func imageName() -> String {
                switch( self ){
                        case .like:
                            return "heart"
                        case .dislike:
                            return "xmark"
                        case .detail:
                            return "questionmark"
                }
        }
    }
    
    var okashiDatalist: OkashiData
    var swipeController: SwipeController
    var favoriteController: FavoriteController
    let controllType: ControllType
    
    @Binding var isDetail : Bool
    
    
    var body: some View {
        ZStack {
            
            if controllType == .detail {
                Color(UIColor.gray)
                    .asRoundShadow(size: 50)
            }
            else {
                Color(UIColor.white)
                    .asRoundShadow(size: 65)
            }
            
            Button(action: {
                
                if controllType == .like {
                    swipeController.finishSwipe(startLocation: CGPoint(x: 0, y: 0), location: CGPoint(x: 151, y: 0), okashiDatalist: okashiDatalist, favoriteController: favoriteController)
                }
                else if controllType == .dislike {
                    swipeController.finishSwipe(startLocation: CGPoint(x: 0, y: 0), location: CGPoint(x: -151, y: 0), okashiDatalist: okashiDatalist, favoriteController: favoriteController)
                }
                else {
                    withAnimation {
                        self.isDetail.toggle()
                    }
                    
                }
                
            }, label: {
                Image(systemName: controllType.imageName())
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: controllType == .detail ? 15 : 30,
                        height: controllType == .detail ? 15 : 30
                    )
                    .foregroundColor(controllType == .detail ? Color(UIColor.white) : Color(UIColor.systemPink))

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
