
import Combine

final class MenuButtonPresenter: ObservableObject {
    
    private let wireframe: MenuButtonWireframeInterface
    
    init(wireframe: MenuButtonWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}



