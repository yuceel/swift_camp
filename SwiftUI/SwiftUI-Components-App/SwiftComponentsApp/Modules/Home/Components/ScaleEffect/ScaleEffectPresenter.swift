import Combine
import Foundation

final class ScaleEffectPresenter : ObservableObject {
    
    private let wireframe :ScaleEffectWireframeInterface
    
    init (wireframe : ScaleEffectWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
