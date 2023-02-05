import SwiftUI

struct CardView: View {
    
    @ObservedObject var okashiDatalist: OkashiData
    @ObservedObject var swipeController: SwipeController
    
    var body: some View {
        
        
        GeometryReader(content: { geometry in
            
            ForEach(okashiDatalist.okashiList.reversed(), id: \.self.id) { okashi in
                ZStack {
                    
                    Color.white
                    
                    Image(uiImage: okashi.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit) // 横か縦がぴったりになるところで縦横比を保ちサイズを整える
                        .frame(width: 200, height: 200)
                        
                }
                .cornerRadius(10)
                .padding(.all, 30)
                .shadow(radius: 1.1)
                .offset(okashiDatalist.okashiList.first!.id == okashi.id ? swipeController.transation : .zero)
                .rotationEffect((okashiDatalist.okashiList.first!.id == okashi.id ? .degrees(Double(swipeController.transation.width / 15)) : .zero))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            swipeController.swipe(translation: value.translation)
                        })
                        .onEnded({ value in
            
                            swipeController.finishSwipe(startLocation: value.startLocation, location: value.location, okashiDatalist: okashiDatalist)
                        })
                )
                .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1))
                
            }
            
        })
        
        
    }
}
