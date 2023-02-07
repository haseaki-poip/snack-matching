import SwiftUI

struct FavoriteView: View {
    @ObservedObject var favoriteController = FavoriteController()
    @State var isDetail: Bool = false;
    
    var body: some View {
        ZStack {
            
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
                        
                    }
                })
                .sheet(isPresented: $isDetail, content: {
                    DetailView(okashiItem: favoriteItem, isDetail: $isDetail)
                })
                
                
            }
            .scrollContentBackground(.hidden)
            .background(Color("appColor"))
            
        }
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    
    static var previews: some View {
        FavoriteView()
    }
}
