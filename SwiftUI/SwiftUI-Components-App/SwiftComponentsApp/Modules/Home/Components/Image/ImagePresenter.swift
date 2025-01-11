
import Combine

final class ImagePresenter: ObservableObject {
    
    private let wireframe: ImageWireframeInterface
    
    init(wireframe: ImageWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}



