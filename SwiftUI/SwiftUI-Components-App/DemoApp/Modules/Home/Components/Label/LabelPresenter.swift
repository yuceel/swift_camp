import Foundation
import Combine

final class LabelPresenter: ObservableObject {
    
    private let wireframe: LabelWireframeInterface
    
    init(wireframe: LabelWireframeInterface) {
        self.wireframe = wireframe
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
