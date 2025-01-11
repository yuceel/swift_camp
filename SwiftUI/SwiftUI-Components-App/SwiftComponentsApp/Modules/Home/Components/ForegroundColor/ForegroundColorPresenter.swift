import Foundation
import Combine
 
final class ForegroundColorPresenter: ObservableObject {
    
    // MARK: - Private properties -
    private let wireframe: ForegroundColorWireframeInterface
 
    // MARK: - Lifecycle -
    init(wireframe: ForegroundColorWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}

