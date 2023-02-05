import SwiftUI

struct DetailView: View {
    let okashiItem: OkashiItem
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    var body: some View {
        ZStack {
            Color
                .black
                .ignoresSafeArea()
                .opacity(0.5)
            
            ZStack {
                Color.white
                
                VStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.gray)
                        })
                        .padding(.all, 30)
                        
                        Spacer()
                        
                    }
                    .frame(width: frameWidth)
                    
                    GeometryReader(content: { geometry in
                        
                        Spacer()
                        
                        VStack {
                            
                            
                            Text(okashiItem.name)
                                .foregroundColor(Color.brown)
                                .font(Font.system(size: 30).bold())
                                .frame(minWidth: 300)
                                .padding()
                            
                            Image(uiImage: okashiItem.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit) // 横か縦がぴったりになるところで縦横比を保ちサイズを整える
                                .frame(width: 200, height: 200)
                                .padding(.all, 20)
                            
                            ScrollView(.vertical, showsIndicators: true) {
                                Text(okashiItem.comment)
                                    .font(Font.system(size: 20))
                            }
                            .padding()
                            .frame(maxHeight: 300)
                            
                            Link("掲載ページへ", destination: okashiItem.link)
                                .padding(.bottom, 50)
                                    
                                
                        }
                        .frame(width: frameWidth)
                        
                        Spacer()
                    })
                    
                }
                .padding(.bottom, 70)
                
            }
            .cornerRadius(20)
            .offset(CGSize(width: 0, height: 70))
            .ignoresSafeArea()
            
        }
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
