import SwiftUI

struct CardView: View {
    
    @State var transation: CGSize = .zero // (x: 0, y: 0)
    
    @ObservedObject var okashiDatalist = OkashiData()
    
    
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
                .offset(okashiDatalist.okashiList.first!.id == okashi.id ? transation : .zero)
                .rotationEffect((okashiDatalist.okashiList.first!.id == okashi.id ? .degrees(Double(transation.width / 15)) : .zero))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            transation = value.translation
                        })
                        .onEnded({ value in
            
                            if value.startLocation.x - 150 > value.location.x {
                                transation = .init(width: -800, height: 0)
                                // 0.3秒遅らせて配列から削除して、animationを最後まで行わせる
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                                    okashiDatalist.removeFirstOkashiInList()
                                    if okashiDatalist.okashiList.count == 5 {
                                        okashiDatalist.addOkashiForList()
                                    }
                                    
                                        transation = .zero
                                        
                                })
                                
                            }
                            else if value.startLocation.x + 150 < value.location.x {
                                transation = .init(width: 800, height: 0)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                                    okashiDatalist.removeFirstOkashiInList()
                                    if okashiDatalist.okashiList.count == 5 {
                                        okashiDatalist.addOkashiForList()
                                    }
                                        
                                        transation = .zero
                                    
                                })
                            }
                            else {
                                transation = .zero
                            }
                        })
                )
                .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1))
                
            }
            
        })
        
        
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
