import Combine
import Foundation

final class ShadowPresenter : ObservableObject {
    
    private let wireframe : ShadowWireframeInterface
    
    init (wireframe : ShadowWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
