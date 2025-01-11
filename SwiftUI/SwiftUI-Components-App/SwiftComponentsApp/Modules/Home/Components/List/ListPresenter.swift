import Foundation
import Combine
 
final class ListPresenter: ObservableObject {
    
    // MARK: - Private properties -
    private let wireframe: ListWireframeInterface
 
    // MARK: - Lifecycle -
    init(wireframe: ListWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
