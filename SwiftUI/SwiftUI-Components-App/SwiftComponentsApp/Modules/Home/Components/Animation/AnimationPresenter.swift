import Combine
import Foundation

final class AnimationPresenter : ObservableObject {
    
    private let wireframe : AnimationWireframeInterface
    
    init (wireframe : AnimationWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
