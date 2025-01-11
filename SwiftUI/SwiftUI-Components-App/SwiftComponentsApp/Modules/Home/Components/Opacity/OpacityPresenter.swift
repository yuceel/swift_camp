
import Combine

final class OpacityPresenter: ObservableObject {
    
    private let wireframe: OpacityWireframeInterface
    
    init(wireframe: OpacityWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}



