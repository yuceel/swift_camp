import Foundation
import Combine
 
final class HStackPresenter: ObservableObject {
    
    // MARK: - Private properties -
    private let wireframe: HStackWireframeInterface
 
    // MARK: - Lifecycle -
    init(wireframe: HStackWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
