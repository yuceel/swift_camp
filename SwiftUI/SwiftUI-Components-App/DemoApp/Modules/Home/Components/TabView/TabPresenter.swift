import Combine
import Foundation

final class TabPresenter : ObservableObject {
    
    private let wireframe : TabWireframeInterface
    
    init (wireframe : TabWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}

