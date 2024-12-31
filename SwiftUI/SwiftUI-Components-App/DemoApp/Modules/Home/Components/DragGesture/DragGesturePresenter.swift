import Foundation
import Combine

final class DragGesturePresenter: ObservableObject {
    
    // MARK: - Private properties -
    private let wireframe: DragGestureWireframeInterface
 
    // MARK: - Lifecycle -
    init(wireframe: DragGestureWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}

