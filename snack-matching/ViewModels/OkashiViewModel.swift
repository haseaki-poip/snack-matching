import Foundation
import UIKit

// Identifiableは一意に識別できる型
// id = UUID()でデータを一意に特定するためのIDを生成する
struct OkashiItem: Identifiable {
    let id = UUID() // idは型定義ではなくUUIDを代入していることに注意
    let name: String
    let link: URL
    let image: UIImage
    let comment: String
}

class OkashiData: ObservableObject {
    // Jsonデータ構造
    struct ResultJson: Codable {
        struct Item: Codable {
            let name: String?
            let url: URL?
            let image: URL?
            let comment: String?
        }
        
        let item: [Item]?
    }
    
    @Published var okashiList: [OkashiItem] = []
    
    init() {
        self.serchOkashi(keyword: "", max: 15)
        
    }
    
    func serchOkashi(keyword: String, max: Int){
        var req_url_string: String = "https://www.sysbird.jp/webapi/?apikey=guest&format=json"
        
        if keyword != "" {
            // キーワードをエンコード
            guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                return
            }
            
            req_url_string += "&keyword=\(keyword_encode)"
        }
        
        req_url_string += "&max=\(max)&order=r"
        
        
        // リクエストURLを組み立て
        guard let req_url = URL(string: req_url_string) else {
            return
        }
        
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)

        let task = session.dataTask(with: req_url, completionHandler: { data , response, error in
           session.finishTasksAndInvalidate()
            
           if let error = error {
               print(error.localizedDescription)
               print("通信が失敗しました")
               return
           }
           
           guard let data = data,
                 let response = response as? HTTPURLResponse else {
               print("データもしくはレスポンスがnilの状態です")
               return
           }
           
           if response.statusCode == 200 {

               do {
                   
                   let json = try JSONDecoder().decode(ResultJson.self, from: data)
                   
                   if let items = json.item { // itemsに代入しつつ、それがnilかどうか。nilでなければその{}の処理を行え、その中でitemsを使える
                       
                       for item in items {
                           if let name = item.name,
                              let link = item.url,
                              let comment = item.comment,
                              let imageURL = item.image,
                              let imageData = try? Data(contentsOf: imageURL),
                              let image = UIImage(data: imageData)?.withRenderingMode(.alwaysOriginal) {
                               
                               // ifにより上の要素が一つもnilでないため以下の処理を行うことができる
                               let okashi = OkashiItem(name: name, link: link, image: image, comment: comment)
                               self.okashiList.append(okashi)
                               
                           }
                       }
                   }
                   else {
                       self.okashiList.removeAll()
                   }
                   
                   
               } catch let error {
                   print(":エラー:\(error)") // JSONの値がIDがIntなのに、StructでIDをStringと宣言している時などエラーになる。
               }
               
               
           } else {
               print("statusCode:\(response.statusCode)")
           }
        })
        
        task.resume()
    }
    
    // お菓子をlistに追加していく
    func addOkashiForList(){
        self.serchOkashi(keyword: "", max: 10)
    }
    
    func removeFirstOkashiInList() {
        self.okashiList.removeFirst()
    }
    
}
