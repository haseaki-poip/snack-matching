import SwiftUI

struct BottomControllView: View {
    @ObservedObject var okashiDatalist: OkashiData
    @ObservedObject var swipeController: SwipeController
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    var body: some View {
        HStack {
            
            BottomButtonView(okashiDatalist: okashiDatalist, swipeController: swipeController, controllType: .dislike)
            
            BottomButtonView(okashiDatalist: okashiDatalist, swipeController: swipeController, controllType: .detail)
            
            BottomButtonView(okashiDatalist: okashiDatalist, swipeController: swipeController, controllType: .like)
                   
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
    let controllType: ControllType
    
    
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
                    swipeController.finishSwipe(startLocation: CGPoint(x: 0, y: 0), location: CGPoint(x: 151, y: 0), okashiDatalist: okashiDatalist)
                }
                else if controllType == .dislike {
                    swipeController.finishSwipe(startLocation: CGPoint(x: 0, y: 0), location: CGPoint(x: -151, y: 0), okashiDatalist: okashiDatalist)
                }
                else {
                    print("detail")
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
