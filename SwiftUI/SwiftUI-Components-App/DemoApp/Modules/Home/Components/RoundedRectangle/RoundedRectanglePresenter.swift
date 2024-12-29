import Combine
import Foundation

final class RoundedRectanglePresenter : ObservableObject {
    
    private let wireframe : RoundedRectangleWireframeInterface
    
    init (wireframe : RoundedRectangleWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
