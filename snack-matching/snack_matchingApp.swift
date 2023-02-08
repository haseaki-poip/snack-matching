import SwiftUI

@main
struct snack_matchingApp: App {
    @ObservedObject var favoriteController = FavoriteController()
    @ObservedObject var okashiDatalist = OkashiData()
    
    var body: some Scene {
        WindowGroup {
            AppView(favoriteController: favoriteController, okashiDatalist: okashiDatalist, selectedPage: .home)
        }
    }
}
