import Combine
import Foundation

final class MapPresenter : ObservableObject {
    
    private let wireframe :MapWireframeInterface
    
    init (wireframe : MapWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
