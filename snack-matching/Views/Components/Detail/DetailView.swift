import SwiftUI

struct DetailView: View {
    
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
                        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
