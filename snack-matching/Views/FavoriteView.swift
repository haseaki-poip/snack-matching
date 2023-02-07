import SwiftUI

struct FavoriteView: View {
    @ObservedObject var favoriteController = FavoriteController()
    @State var isDetail = false
    
    var body: some View {
        ZStack {
            
            Color("appColor")
                .ignoresSafeArea()
            
            VStack {
                TopControllView(selectedPage: .favorite)
                
                Text("お気に入り")
                    .font(Font.system(size: 30).bold())
                    .padding(.top, 10)
                
                List(favoriteController.favoriteList) { favoriteItem in
                    
                    Button(action: {
                        isDetail.toggle()
                    }, label: {
                        HStack {
                            
                            Image(uiImage: favoriteItem.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                            
                            Text(favoriteItem.name)
                                .font(Font.system(size: 15).bold())
                                .foregroundColor(Color.brown)
                            
                            
                        }
                    })
                    .sheet(isPresented: $isDetail, content: {
                        DetailView(okashiItem: favoriteItem)
                            .navigationBarHidden(true)
                    })
                    
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color("appColor"))
                
            }
        }
        .navigationBarHidden(true)
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
