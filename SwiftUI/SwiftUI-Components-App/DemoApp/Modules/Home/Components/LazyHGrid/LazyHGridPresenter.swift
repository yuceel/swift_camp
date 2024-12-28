import Foundation
import Combine

final class LazyHGridPresenter: ObservableObject {
    
    private let wireframe: LazyHGridWireframeInterface
    
    init(wireframe: LazyHGridWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}


