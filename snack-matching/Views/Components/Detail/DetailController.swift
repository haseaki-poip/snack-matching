import Foundation

class DetailController: ObservableObject {
    
    @Published var isDetail: Bool = false
    
    func changeDetail() {
        self.isDetail = !self.isDetail
    }
}
