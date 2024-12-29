
import Combine

final class CirclePresenter: ObservableObject {
    
    private let wireframe: CircleWireframeInterface
    
    init(wireframe: CircleWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}


