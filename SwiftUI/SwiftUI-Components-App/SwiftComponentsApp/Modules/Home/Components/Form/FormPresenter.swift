import Foundation
import Combine

final class FormPresenter: ObservableObject {
    
    private let wireframe: FormWireframeInterface
    
    init(wireframe: FormWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
