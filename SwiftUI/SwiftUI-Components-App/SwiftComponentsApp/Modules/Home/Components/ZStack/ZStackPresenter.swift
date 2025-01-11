import Foundation
import Combine

final class ZStackPresenter: ObservableObject {
    
    // MARK: - Private properties -
    private let wireframe: ZStackWireframeInterface

    // MARK: - Lifecycle -
    init(wireframe: ZStackWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
