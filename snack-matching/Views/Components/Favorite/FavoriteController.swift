import Foundation
import UIKit

class FavoriteController: ObservableObject {
    
    struct SaveItem: Codable {
        let name: String
        let link: URL
        let image_url: URL
        let comment: String
    }
    
    
    
    @Published var favoriteList: [OkashiItem] = []
    
    private var saveList = [String: Any]() // ローカル保存するデータ形式は[[String]: Any]の辞書型配列
    
    init() {
        
        // UIの更新をDispatchQueue.main.asyncによりメインスレッド行うことで
        // アプリでの処理速度が高まる。特に画面遷移が早くなった。
        DispatchQueue.main.async {
            guard let saveJsonList = UserDefaults.standard.object(forKey: "favorite") as? [String: Any] else {
                return
            }
            
            self.saveList = saveJsonList
            
            for saveJsonItem in saveJsonList {
                if let saveItem = try? JSONDecoder().decode(SaveItem.self, from: saveJsonItem.value as! Data) {
                    
                    let id = saveJsonItem.key
                    let name = saveItem.name
                    let link = saveItem.link
                    let image_url = saveItem.image_url
                    let comment = saveItem.comment
                    
                    
                    if  let imageData = try? Data(contentsOf: image_url),
                        let image = UIImage(data: imageData)?.withRenderingMode(.alwaysOriginal) {
                        self.favoriteList.append(
                            OkashiItem(id: id, name: name, link: link, image: image, image_url: image_url, comment: comment)
                        )
                        
                    }
                    
                    
                    
                }
            }
        }
        
    }
    
    func saveFaVoriteItem(okashiItem: OkashiItem) {
        
        let saveItem = SaveItem(
                            name: okashiItem.name,
                            link: okashiItem.link,
                            image_url: okashiItem.image_url,
                            comment: okashiItem.comment
                         )
        
        guard let saveItem_json = try? JSONEncoder().encode(saveItem) else {
           print("Can not Encode to JSON.")
           return
        }
        
        // ローカルに保存
        // 辞書配列で保存するのはお気に入りの重複を防ぐため
        self.saveList[okashiItem.id] = saveItem_json
        UserDefaults.standard.set(self.saveList, forKey: "favorite")
        
        self.favoriteList.append(okashiItem)
        
    }
    
}
