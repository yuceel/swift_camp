import Foundation

final class BackgroundPresenter: ObservableObject {
    private let wireframe: BackgroundWireframeInterface
    
    init(wireframe: BackgroundWireframeInterface) {
        self.wireframe = wireframe
    }
    func goBack() {
        wireframe.goBack()
    }
}


