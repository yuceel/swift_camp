import Combine
import Foundation

final class ButtonPresenter : ObservableObject {
    
    private let wireframe : ButtonWireframeInterface
    
    init (wireframe : ButtonWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
