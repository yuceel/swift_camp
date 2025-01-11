import Foundation
import Combine

final class ActionSheetPresenter: ObservableObject {
    
    // MARK: - Private properties -
    private let wireframe: ActionSheetWireframeInterface
 
    // MARK: - Lifecycle -
    init(wireframe: ActionSheetWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}

