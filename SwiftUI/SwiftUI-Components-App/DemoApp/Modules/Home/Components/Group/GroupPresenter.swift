import Foundation
import Combine

final class GroupPresenter: ObservableObject {
    
    private let wireframe: GroupWireframeInterface
    
    init(wireframe: GroupWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}

