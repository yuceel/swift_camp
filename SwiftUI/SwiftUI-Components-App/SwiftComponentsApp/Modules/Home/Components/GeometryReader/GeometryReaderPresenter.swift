import Foundation

final class GeometryReaderPresenter: ObservableObject {
    
    private let wireframe: GeometryReaderWireframeInterface
    
    init(wireframe: GeometryReaderWireframeInterface) {
        self.wireframe = wireframe

    }
    
    func goBack() {
        wireframe.goBack()
    }
}
