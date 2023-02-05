import SwiftUI

struct BottomControllView: View {
    @ObservedObject var okashiDatalist: OkashiData
    @ObservedObject var swipeController: SwipeController
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    var body: some View {
        HStack {
            
            BottomButtonView(okashiDatalist: okashiDatalist, swipeController: swipeController, frameWidth: frameWidth, imageSize: 30, backgroundSize: 65, imageName: "xmark", imageColor: Color(UIColor.systemPink), backgroundColor: Color(UIColor.white))
            
            BottomButtonView(okashiDatalist: okashiDatalist, swipeController: swipeController, frameWidth: frameWidth, imageSize: 15, backgroundSize: 50, imageName: "questionmark", imageColor: Color(UIColor.white), backgroundColor: Color(UIColor.gray))
            
            BottomButtonView(okashiDatalist: okashiDatalist, swipeController: swipeController, frameWidth: frameWidth, imageSize: 30, backgroundSize: 65, imageName: "heart", imageColor: Color(UIColor.systemPink), backgroundColor: Color(UIColor.white))
                   
        }
        .padding()
        .frame(width: frameWidth)
    }
}

struct BottomButtonView: View {
    var okashiDatalist: OkashiData
    var swipeController: SwipeController
    
    let frameWidth: CGFloat
    let imageSize: CGFloat
    let backgroundSize: CGFloat
    let imageName: String
    let imageColor: Color
    let backgroundColor: Color
    
    
    var body: some View {
        ZStack {
            
            backgroundColor
                .frame(width: backgroundSize, height: backgroundSize)
                .cornerRadius(50)
                .shadow(radius: 10)
            
            Button(action: {
                swipeController.finishSwipe(startLocation: CGPoint(x: 0, y: 0), location: CGPoint(x: 151, y: 0), okashiDatalist: okashiDatalist)
                
            }, label: {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .foregroundColor(imageColor)

            })
                
        }
        .frame(width: frameWidth / 4)
    }
}
