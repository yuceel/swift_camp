
import Combine

final class GridRowPresenter: ObservableObject {
    
    private let wireframe: GridRowWireframeInterface
    
    init(wireframe: GridRowWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}



