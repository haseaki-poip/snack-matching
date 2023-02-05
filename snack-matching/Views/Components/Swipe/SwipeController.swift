import Foundation
import SwiftUI

class SwipeController: ObservableObject {
    
    @Published var transation: CGSize = .zero // (x: 0, y: 0)
    
    func swipe(translation: CGSize) {
        self.transation = translation
    }
    
    func finishSwipe(startLocation: CGPoint, location: CGPoint, okashiDatalist: OkashiData) {
        
        if startLocation.x - 150 > location.x {
            self.transation = .init(width: -800, height: 0)
            // 0.3秒遅らせて配列から削除して、animationを最後まで行わせる
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                okashiDatalist.removeFirstOkashiInList()
                if okashiDatalist.okashiList.count == 5 {
                    okashiDatalist.addOkashiForList()
                }
                
                self.transation = .zero
                    
            })
            
        }
        else if startLocation.x + 150 < location.x {
            self.transation = .init(width: 800, height: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                okashiDatalist.removeFirstOkashiInList()
                if okashiDatalist.okashiList.count == 5 {
                    okashiDatalist.addOkashiForList()
                }
                    
                self.transation = .zero
                
            })
        }
        else {
            self.transation = .zero
        }
    }
    
}
