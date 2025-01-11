import Foundation
import Combine
 
final class AlertPresenter: ObservableObject {
    
    // MARK: - Private properties -
    private let wireframe: AlertWireframeInterface
 
    // MARK: - Lifecycle -
    init(wireframe: AlertWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}

