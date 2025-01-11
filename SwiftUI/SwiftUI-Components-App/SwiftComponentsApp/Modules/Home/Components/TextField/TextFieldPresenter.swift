import Foundation

final class TextFieldPresenter:ObservableObject {
    private let wireframe: TextFieldWireframeInterface
    
    init(wireframe: TextFieldWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
