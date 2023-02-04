import SwiftUI

struct BottomControllView: View {
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    var body: some View {
        HStack {
            
            BottomButtonView(frameWidth: frameWidth, imageSize: 30, backgroundSize: 65, imageName: "xmark", imageColor: Color(UIColor.systemPink), backgroundColor: Color(UIColor.white))
            
            BottomButtonView(frameWidth: frameWidth, imageSize: 15, backgroundSize: 50, imageName: "questionmark", imageColor: Color(UIColor.white), backgroundColor: Color(UIColor.gray))
            
            BottomButtonView(frameWidth: frameWidth, imageSize: 30, backgroundSize: 65, imageName: "heart", imageColor: Color(UIColor.systemPink), backgroundColor: Color(UIColor.white))
                   
        }
        .padding()
        .frame(width: frameWidth)
    }
}

struct BottomButtonView: View {
    
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
