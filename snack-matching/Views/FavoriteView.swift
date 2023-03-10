import SwiftUI

struct FavoriteView: View {
    var favoriteController: FavoriteController
    var okashiDatalist: OkashiData
    let selectedPage: PageType
    
    
    var body: some View {
        ZStack {
            
            Color("appColor")
                .ignoresSafeArea()
            
            VStack {
                
                TopControllView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: selectedPage)
                
                NavigationView {
                    
                    List(favoriteController.favoriteList) { favoriteItem in
                        
                        ListButtonView(favoriteItem: favoriteItem)
                        
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color("appColor"))
                    .navigationTitle(Text("お気に入り"))
                    // Listで渡す配列が空の時background(Color("appColor"))は反映されなくなるため、
                    // タイトルをつけ配列がからでリストが表示されなくてもbackground(Color("appColor"))
                    // が反映されるようにした
                    
                }
            }
                
        }
        .navigationBarHidden(true)
        
    }
}

struct ListButtonView: View {
    let favoriteItem: OkashiItem
    
    @State var isDetail = false
    
    var body: some View {
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
}
