import Combine
import Foundation

final class AttributedTextPresenter : ObservableObject {
    
    private let wireframe : AttributedTextWireframeInterface
    
    init (wireframe : AttributedTextWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}

