import Foundation

final class CornerRadiusPresenter: ObservableObject {
    private let wireframe: CornerRadiusWireframeInterface
    
    init(wireframe: CornerRadiusWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    
    }
}
