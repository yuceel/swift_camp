
import Combine

final class BindingPresenter: ObservableObject {
    
    private let wireframe: BindingWireframeInterface
    
    init(wireframe: BindingWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}


